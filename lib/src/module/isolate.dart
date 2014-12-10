part of stretch_module;

// needs extending
class IsolatePort {
  final SendPort send;
  final ReceivePort receive;
  Stream _broadcast;

  IsolatePort(this.send): this.receive = new ReceivePort() {
    this.send.send(this.receive.sendPort);
    _broadcast = receive.asBroadcastStream();
    _broadcast.listen(_internalListener);
  }

  void write(dynamic message) => send.send(message);

  void listen(void onData(dynamic event), { Function onError, void onDone(), bool cancelOnError}) {
    _broadcast.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  void _internalListener(dynamic message) {

  }
}