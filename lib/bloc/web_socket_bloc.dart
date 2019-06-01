import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_match/serializers.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_match/api.dart';
import 'package:uuid/uuid.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> with WidgetsBindingObserver {
  IOWebSocketChannel _channel;
  final _eventStream = new PublishSubject<Object>();

  @override
  WebSocketState get initialState => WebSocketDisconnected(null);

  WebSocketBloc() {
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  Stream<WebSocketState> mapEventToState(WebSocketEvent event) async* {
    if (event is WebSocketConnect) {
      yield* _handleConnect(event);
    } else if (event is WebSocketDisconnect) {
      yield WebSocketDisconnected(currentState.userId);
      Timer(
          Duration(seconds: 10),
              () => this.dispatch(WebSocketConnect(currentState.userId)));

    }
  }

  Stream<WebSocketState> _handleConnect(WebSocketConnect event) async* {
    if (state is WebSocketDisconnected) {
      try {
        final url = "ws://$apiHost/ws/${event.userId}";
        debugPrint('Connecting to websocket: ' + url);
        this._channel = IOWebSocketChannel.connect(url);

        _channel.stream
            .listen(_parseEvent, onError: _handleError, onDone: _handleDone);
        yield WebSocketConnected(event.userId);

      } catch (e) {
        debugPrint('Error connecting to web socket.');
        debugPrint(e.toString());
        yield WebSocketDisconnected(event.userId);
        Timer(
            Duration(seconds: 10),
                () => this.dispatch(WebSocketConnect(event.userId)));
      }
    }
  }

  void _send(data) {
    assert(_channel != null);
    this._channel.sink.add(data);
  }

  Map<String, dynamic> _parseJson(String jsonString) => json.decode(jsonString);

  void _parseEvent(event) async {
    debugPrint('Received websocket message: ' + event.toString());
    try {
      final dataString = event.toString();
      final jsonData = _parseJson(dataString);
          final data = serializers.deserialize(jsonData,
              specifiedType: FullType(Object));
          if (jsonData['eventType'] == 'PING') {
            debugPrint('websocket PING');
          } else {
            this.dispatch(DataReceived(data: data));
          }
    } catch (e) {
      debugPrint(
          'Could not parse web socket event to JSON: ' + event.toString());
      debugPrint('Error: ' + e.toString());
    }
  }

  _handleError(error, StackTrace stackTrace) {
    debugPrint('Error in websocket!');
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
    debugPrint('We are connected. Maybe we should disconnect?');
  }

  _handleDone() {
    debugPrint('Websocket connection lost');
    this.dispatch(WebSocketDisconnect());
  }

  _close() {
    if (_channel != null) {
      if (_channel.sink != null) {
        _channel.sink.close();
      }
    }
    this._channel = null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        currentState is WebSocketDisconnected) {
      this.dispatch(WebSocketConnect(currentState.userId));
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _eventStream.close();
    _close();
    super.dispose();
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    debugPrint(error.toString());
    debugPrint(stacktrace.toString());
    super.onError(error, stacktrace);
  }
}

abstract class WebSocketEvent {
}

class WebSocketConnect extends WebSocketEvent {
  final Uuid userId;

  WebSocketConnect(this.userId);
}


class WebSocketDisconnect extends WebSocketEvent {
}


class DataReceived extends WebSocketEvent {
  final Object data;

  DataReceived({@required this.data});

  @override
  String toString() => 'DataReceived';
}



abstract class WebSocketState extends Equatable {
  Uuid userId;
}
class WebSocketDisconnected extends WebSocketState {
  final Uuid userId;

  WebSocketDisconnected(this.userId);

}
class WebSocketConnected extends WebSocketState {
  final Uuid userId;

  WebSocketConnected(this.userId);

}

