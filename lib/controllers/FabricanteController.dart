import 'package:aqueduct/aqueduct.dart';
import '../model/fabricante.dart';

class FabricanteController extends ResourceController {
  final ManagedContext context;

  FabricanteController(this.context);

/** 
  final List fabricantes = [
    "Alcatel",
    "BBK Electronics",
    "BenQ",
    "BlackBerry",
    "Blu Products",
    "Ericsson",
    "Gionee",
    "Gradiente",
    "HMD Global",
    "Huawei",
    "J.C.Bamford",
    "Jolla",
    "Kyocera",
    "Lenovo",
    "LG Electronics",
    "Microsoft Mobile",
    "Motorola",
    "Multilaser",
    "Nokia",
    "OnePlus",
    "Palm, Inc.",
    "Pantech Curitel",
    "Quantum",
    "Realme",
    "Samsung",
    "Sanyo",
    "Sharp Corporation",
    "Sony",
    "TCL Corporation",
    "Toshiba",
    "Vertu",
    "Vivo",
    "Xiaomi",
    "Xtouch",
    "ZTE"
  ];
  */

  @Operation.get()
  Future<Response> getAll() async {
    try {
      final fabricanteQuery = Query<Fabricante>(context);
      final fabricantes = await fabricanteQuery.fetch();
      return Response.ok({"Fabricantes": fabricantes});
    } catch (e) {
      return Response.badRequest(body: {"400 Response": e.toString()});
    }
  }

  @Operation.get("id")
  Future<Response> getFabricante(@Bind.path("id") int id) async {
    final fabricanteQuery = Query<Fabricante>(context)
      ..where((f) => f.id).equalTo(id);
    final fabricante = await fabricanteQuery.fetchOne();
    if (fabricante == null) {
      return Response.notFound();
    }
    return Response.ok(fabricante);
  }
}
