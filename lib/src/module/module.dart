part of stretch_module;

abstract class Module {
  IsolatePort port;

  Module.load(SendPort sport) {
    port = new IsolatePort(sport);
  }

  void unload() {

  }
}