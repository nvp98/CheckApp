class STestModel {
  int? idDeThi;
  String? maDe;
  String? tenDe;
  int? diemChuan;
  int? thoiGianLamBai;
  int? idnd;
  int? gvid;
  int? tongSoCau;
  List<CauHoiDeThi>? cauHoiDeThi;

  STestModel(
      {this.idDeThi,
      this.maDe,
      this.tenDe,
      this.diemChuan,
      this.thoiGianLamBai,
      this.idnd,
      this.gvid,
      this.tongSoCau,
      this.cauHoiDeThi});

  STestModel.fromJson(Map<String, dynamic> json) {
    idDeThi = json['idDeThi'];
    maDe = json['maDe'];
    tenDe = json['tenDe'];
    diemChuan = json['diemChuan'];
    thoiGianLamBai = json['thoiGianLamBai'];
    idnd = json['idnd'];
    gvid = json['gvid'];
    tongSoCau = json['tongSoCau'];
    if (json['cauHoiDeThi'] != null) {
      cauHoiDeThi = <CauHoiDeThi>[];
      json['cauHoiDeThi'].forEach((v) {
        cauHoiDeThi!.add(new CauHoiDeThi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDeThi'] = this.idDeThi;
    data['maDe'] = this.maDe;
    data['tenDe'] = this.tenDe;
    data['diemChuan'] = this.diemChuan;
    data['thoiGianLamBai'] = this.thoiGianLamBai;
    data['idnd'] = this.idnd;
    data['gvid'] = this.gvid;
    data['tongSoCau'] = this.tongSoCau;
    if (this.cauHoiDeThi != null) {
      data['cauHoiDeThi'] = this.cauHoiDeThi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CauHoiDeThi {
  int? idCauHoiDeThi;
  int? idCauHoi;
  int? idDeThi;
  double? diem;
  int? iddaUng;
  String? tenA;
  CauHoi? cauHoi;

  CauHoiDeThi(
      {this.idCauHoiDeThi,
      this.idCauHoi,
      this.idDeThi,
      this.diem,
      this.iddaUng,
      this.tenA,
      this.cauHoi});

  CauHoiDeThi.fromJson(Map<String, dynamic> json) {
    idCauHoiDeThi = json['idCauHoiDeThi'];
    idCauHoi = json['idCauHoi'];
    idDeThi = json['idDeThi'];
    diem = json['diem'].toDouble();
    iddaUng = json['iddaĐung'];
    tenA = json['tenĐA'];
    cauHoi =
        json['cauHoi'] != null ? new CauHoi.fromJson(json['cauHoi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCauHoiDeThi'] = this.idCauHoiDeThi;
    data['idCauHoi'] = this.idCauHoi;
    data['idDeThi'] = this.idDeThi;
    data['diem'] = this.diem!.toDouble();
    data['iddaĐung'] = this.iddaUng;
    data['tenĐA'] = this.tenA;
    if (this.cauHoi != null) {
      data['cauHoi'] = this.cauHoi!.toJson();
    }
    return data;
  }
}

class CauHoi {
  int? idch;
  String? noiDungCH;
  String? dapAnA;
  String? dapAnB;
  String? dapAnC;
  String? dapAnD;
  int? iddaUng;
  int? idnd;
  int? gvid;

  CauHoi(
      {this.idch,
      this.noiDungCH,
      this.dapAnA,
      this.dapAnB,
      this.dapAnC,
      this.dapAnD,
      this.iddaUng,
      this.idnd,
      this.gvid});

  CauHoi.fromJson(Map<String, dynamic> json) {
    idch = json['idch'];
    noiDungCH = json['noiDungCH'];
    dapAnA = json['dapAnA'];
    dapAnB = json['dapAnB'];
    dapAnC = json['dapAnC'];
    dapAnD = json['dapAnD'];
    iddaUng = json['iddaĐung'];
    idnd = json['idnd'];
    gvid = json['gvid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idch'] = this.idch;
    data['noiDungCH'] = this.noiDungCH;
    data['dapAnA'] = this.dapAnA;
    data['dapAnB'] = this.dapAnB;
    data['dapAnC'] = this.dapAnC;
    data['dapAnD'] = this.dapAnD;
    data['iddaĐung'] = this.iddaUng;
    data['idnd'] = this.idnd;
    data['gvid'] = this.gvid;
    return data;
  }
}
