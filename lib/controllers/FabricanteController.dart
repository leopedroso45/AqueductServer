import 'package:aqueduct/aqueduct.dart';

class FabricanteController extends ResourceController{

  final ManagedContext context;

  final List fabricantes = [
    "Alcatel", "BBK Electronics", "BenQ", "BlackBerry", "Blu Products", "Ericsson", "Gionee", "Gradiente", "HMD Global", "Huawei", "J.C.Bamford", "Jolla", "Kyocera", "Lenovo", "LG Electronics", "Microsoft Mobile", "Motorola", "Multilaser", "Nokia", "OnePlus", "Palm, Inc.", "Pantech Curitel", "Quantum", "Realme", "Samsung", "Sanyo", "Sharp Corporation", "Sony", "TCL Corporation", "Toshiba", "Vertu", "Vivo", "Xiaomi", "Xtouch", "ZTE"
  ];

  FabricanteController(this.context);

  @Operation.get()
  Future<Response> getAll() async{
    try{
      return Response.ok({"Fabricantes": fabricantes});
    }catch(e){
      return Response.badRequest(body: {"Fabricantes":"Requisição não identificada!"});
    }
  }

  @Operation.get("id")
  Future<Response> getFabricante(@Bind.path("id") int id) async{
    try{
      return Response.ok({"Fabricante":fabricantes[id]});
    }catch(e){
      return Response.badRequest(body: {"Fabricante":"Requisição não identificada!"});
    }
  }

}