class Campo{
  double _campodouble = 0;
  int _campoint = 0;
  String _campostr = "";

  setCampoDouble(double valor){
    this._campodouble = valor;
  }

  getCampoDouble(){
    return this._campodouble;
  }

  setCampoInt(int valor){
    this._campoint = valor;
  }

  getCampoInt(){
    return this._campoint;
  }

  setCampoStr(String valor){
    this._campostr = valor;
  }

  getCampoStr(){
    return this._campostr;
  }
}