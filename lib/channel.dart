import 'teste.dart';

class TesteChannel extends ApplicationChannel {

  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    //this.context = ManagedContext(dataModel, persistentStore)
    context = null;
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/fabricantes/[:id]")
      .link(() => FabricanteController(context));

    return router;
  }
}