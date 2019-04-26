import 'teste.dart';

class TesteChannel extends ApplicationChannel {

  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      "fabricantes_user", "password", "localhost", 5432, "fabricantes");

    context = ManagedContext(dataModel, persistentStore);
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