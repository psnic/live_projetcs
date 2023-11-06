/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var myModal = new bootstrap.Modal(document.getElementById('managerModal'));
var myModalToo = new bootstrap.Modal(document.getElementById('managerModalSecond'));
var modalSMSCases = new bootstrap.Modal(document.getElementById('managerModalRegisterCases'));

$(document).ready(function () {
    $('#recording-icon').hide();
    $("body").on('change', '#inputSpecialization', function () {
        var agencyid = $('#inputSpecialization').val();
        var appointmentwithoptions = '';
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({url: './getmasteragency.htm', data: 'agencyid=' + agencyid,
                    method: 'GET'
                }).done(function (response) {
                    var res = JSON.parse(response);
                    if (res.length === 0) {
                        appointmentwithoptions = '<option value="" selected="true" disabled="true">No Agency Available</option>';
                    } else {
                        appointmentwithoptions = '<option value="" selected="true" disabled="true">Select Agency</option>';
                        for (var a = 0; a < res.length; a++) {
                            appointmentwithoptions += '<option value="' + res[a].magencydetailid + '">' + res[a].agencyname + '</option>';
                        }
                    }
                    $('#inputAppointmentWith').html(appointmentwithoptions);
                    self.close();
                }).fail(function () {
                    self.setTitle('');
                    self.setContent('Something went wrong.');
                });
            }
        });

        $("body").on('keyup', 'input.numbers', function () {
            if (this.value.match(/[^0-9 ]/g)) {
                this.value = this.value.replace(/[^0-9 ]/g, '');
            }
        });

//        $("body").on('change', '#phoneInput', function () {
//            var phn = $('#phoneInput').val();
//            if (phn.length > 1) {
//                $('#makeCallBtn').removeAttr('disabled');
//            } else {
//                $('#makeCallBtn').attr('disabled', 'disabled');
//            }
//        });
//        $('#phoneInput').trigger('change');

        $('#phoneInput').on('change', function () {
            var phn = $(this).val();
            if (phn.length > 1) {
                $('#makeCallBtn').removeAttr('disabled');
            } else {
                $('#makeCallBtn').attr('disabled', 'disabled');
            }
        });

    });

    $('body').on('click', '#showIntegratedNonIntegratedBTN', function () {
        var agencyname = $('#inputAgencyNameSelect').val();
        var casesof = $('#inputCasesOfSelect').val();
        var chk = 0;
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({
                    url: './getintegratednonintegratedcases.htm',
                    data: 'agencyname=' + agencyname + '&casesof=' + casesof,
                    method: 'GET'
                }).done(function (response) {
                    response = JSON.parse(response);
                    var tablerows = '';
                    for (var t = 0; t < response.length; t++) {
                        tablerows += '<tr onclick="caseindex(&quot;' + response[t].caseno + '&quot;)">'
                                + '<td>' + parseInt(t + 1) + '</td>'
                                + '<td>' + response[t].casedate + '</td>'
                                + '<td>' + response[t].caseno + '</td>'
                                + '<td>' + response[t].m_natureofcase.crimeclassification + '</td>'
                                + '<td>' + response[t].complainantdetails.survivoraddress + '</td>'
                                + '<td>' + response[t].complainantdetails.district.districtname + '</td>'
                                + '</tr>';
                    }
                    var content = '<table id="integratedNonIntegratedListTable" class="table table-bordered table-striped">'
                            + '<thead>'
                            + '<th>Sl. No.</th>'
                            + '<th>Case Date</th>'
                            + '<th>Case No.</th>'
                            + '<th>Crime Classification</th>'
                            + '<th>Location</th>'
                            + '<th>District</th>'
                            + '</thead>'
                            + '<tbody>'
                            + tablerows
                            + '</tbody>'
                            + '</table>';
                    $('#integratednonintegratedcontent').html(content);
                    $('#integratedNonIntegratedListTable').DataTable({});
                    self.close();
                }).fail(function () {
                    self.setContent('Something went wrong.');
                });
            }
        });
    });

    $("body").on('change', '#inputAgencyNameSelect', function () {
        var agencytype = $('#inputAgencyNameSelect').val();
        var ilist = '';
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({
                    url: './getintegratednonintegratedagencies.htm',
                    data: 'agencytype=' + agencytype,
                    method: 'GET'
                }).done(function (response) {
                    if (response !== null) {
                        var resp = JSON.parse(response);
                        if (agencytype === 'I') {
                            for (var a = 0; a < resp.length; a++) {
                                ilist += '<option value="' + resp[a].integratedagencyid + '">' + resp[a].integratedagencyname + '</option>';
                            }
                        } else if (agencytype === 'N') {
                            for (var a = 0; a < resp.length; a++) {
                                ilist += '<option value="' + resp[a].nonintegratedagencyid + '">' + resp[a].nonintegratedagencyname + '</option>';
                            }
                        }
                        $('#inputCasesOfSelect').html(ilist);
                    }
                    self.close();
                }).fail(function () {
                    self.setTitle('');
                    self.setContent('Something went wrong.');
                });
            }
        });
    });

    $("body").on('change', '#inputDistrict', function () {
        var districtcode = $('#inputDistrict').val();
        var blockoptions = '';
        var psoptions = '';
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({
                    url: './getblockandpsondistrict.htm',
                    data: 'districtcode=' + districtcode,
                    method: 'GET'
                }).done(function (response) {
                    var res = JSON.parse(response);
                    var blocks = JSON.parse(res.blocks);
                    var police = JSON.parse(res.policestation);
                    if (blocks.length === 0) {
                        blockoptions = '<option value="" selected="true" disabled="true">No Block Available</option>';
                    } else {
                        blockoptions = '<option value="" selected="true" disabled="true">Select Block</option>';
                        for (var b = 0; b < blocks.length; b++) {
                            blockoptions += '<option value="' + blocks[b].blockcode + '">' + blocks[b].block_name + '</option>';
                        }
                    }
                    if (police.length === 0) {
                        psoptions = '<option value="" selected="true" disabled="true">No Police Station Available</option>';
                    } else {
                        psoptions = '<option value="" selected="true" disabled="true">Select Police Station</option>';
                        for (var p = 0; p < police.length; p++) {
                            psoptions += '<option value="' + police[p].policestationcode + '">' + police[p].policestation + '</option>';
                        }
                    }
                    $('#inputBlock').html(blockoptions);
                    $('#inputPoliceStation').html(psoptions);
                    self.close();
                }).fail(function () {
                    self.setTitle('');
                    self.setContent('Something went wrong.');
                });
            }
        });
    });

    $("body").on('change', '#inputIncidentDistrict', function () {
        var districtcode = $('#inputIncidentDistrict').val();
        var blockoptions = '';
        var psoptions = '';
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({
                    url: './getblockandpsondistrict.htm',
                    data: 'districtcode=' + districtcode,
                    method: 'GET'
                }).done(function (response) {
                    var res = JSON.parse(response);
                    var blocks = JSON.parse(res.blocks);
                    var police = JSON.parse(res.policestation);
                    if (blocks.length === 0) {
                        blockoptions = '<option value="" selected="true" disabled="true">No Block Available</option>';
                    } else {
                        blockoptions = '<option value="" selected="true" disabled="true">Select Block</option>';
                        for (var b = 0; b < blocks.length; b++) {
                            blockoptions += '<option value="' + blocks[b].blockcode + '">' + blocks[b].block_name + '</option>';
                        }
                    }
                    if (police.length === 0) {
                        psoptions = '<option value="" selected="true" disabled="true">No Police Station Available</option>';
                    } else {
                        psoptions = '<option value="" selected="true" disabled="true">Select Police Station</option>';
                        for (var p = 0; p < police.length; p++) {
                            psoptions += '<option value="' + police[p].policestationcode + '">' + police[p].policestation + '</option>';
                        }
                    }
                    $('#inputIncidentBlock').html(blockoptions);
                    $('#inputIncidentPoliceStation').html(psoptions);
                    self.close();
                }).fail(function () {
                    self.setTitle('');
                    self.setContent('Something went wrong.');
                });
            }
        });
    });

    $("body").on('submit', '#appointmentForm', function (e) {
        e.preventDefault();
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var formData = new FormData($(this)[0]);
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({
                    url: './managersaveappointment.htm',
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(csrfHeader, csrfToken);
                    }
                }).done(function (response) {
                    var res = JSON.parse(response);
                    self.setTitle(res.title);
                    self.setContent(res.message);
                }).fail(function () {
                    self.setTitle('');
                    self.setContent('Something went wrong.');
                });
            },
            buttons: {
                close: {
                    action: function () {
                        $('#appointmentForm').trigger("reset");
                    }
                }
            }
        });
    });

    $("body").on('submit', '#registerMobileSmsForm', function (e) {
        e.preventDefault();
        var formData = new FormData($(this)[0]);
        $.confirm({
            content: function () {
                var self = this;
                return $.ajax({
                    url: './saavemobilesmscases.htm',
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false
                }).done(function (response) {
                    var res = JSON.parse(response);
                    self.setTitle(res.title);
                    self.setContent(res.message);
                }).fail(function () {
                    self.setTitle('');
                    self.setContent('Something went wrong.');
                });
            },
            buttons: {
                close: {
                    action: function () {
                        $('#registerMobileSmsForm').trigger("reset");
                        modalSMSCases.hide();
                    }
                }
            }
        });
    });

    $("body").on('keyup', 'input.lettersSpc', function () {
        if (this.value.match(/[^a-zA-Z \s]/)) {
            this.value = this.value.replace(/[^a-zA-Z \s]*$/, '');
        }
    });

    $("body").on('keyup', 'input.numbers', function () {
        if (this.value.match(/[^0-9 ]/g)) {
            this.value = this.value.replace(/[^0-9 ]/g, '');
        }
    });

});

//  FUNCTION CALLS STARTS HERE

function getcasesbydistrictcode(districtcode, districtname, deskid) {
    $('#managerModalSecondLabel').html('Case Detail For: ' + districtname);
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './getcaselistbydistrict.htm',
                data: 'districtcode=' + districtcode + '&deskid=' + deskid,
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                var caselist = JSON.parse(res.caselist);
                var followupcaselist = JSON.parse(res.followupcaselist);
                var tablecontent = '<table class="table table-striped table-bordered"><thead><th>Sl. No.</th><th>Case Date</th><th>Case No.</th><th>Crime Classification</th><th>Location</th><th>District</th></thead><tbody>';
                var table_freshcases_title = '<h4 class="my-2">Fresh Cases List</h4>';
                var table_freshcases_list = '';
                for (var c = 0; c < caselist.length; c++) {
                    var crimeclassification = caselist[c].m_natureofcase ? caselist[c].m_natureofcase.crimeclassification : '';
                    table_freshcases_list += '<tr class="fake-btn" onclick="caseindex(&quot;' + caselist[c].caseno + '&quot;)">'
                            + '<td>' + parseInt(c + 1) + '</td>'
                            + '<td>' + caselist[c].casedate + '</td>'
                            + '<td>' + caselist[c].caseno + '</td>'
                            + '<td>' + crimeclassification + '</td>'
                            + '<td>' + caselist[c].complainantdetails.survivoraddress + '</td>'
                            + '<td>' + caselist[c].complainantdetails.district.districtname + '</td>'
                            + '</tr>';
                }
                var freshcases_full = table_freshcases_title + tablecontent + table_freshcases_list + '</tbody></table>';
                var table_followupcases_title = '<h4 class="my-2">Follow Up Cases List</h4>';
                var table_followupcases_list = '';
                for (var f = 0; f < followupcaselist.length; f++) {
                    var crimeclassification = followupcaselist[f].basic_casedetails.m_natureofcase ? followupcaselist[f].basic_casedetails.m_natureofcase.crimeclassification : '';
                    table_followupcases_list += '<tr class="fake-btn" onclick="caseindex(&quot;' + followupcaselist[f].basic_casedetails.caseno + '&quot;)">'
                            + '<td>' + parseInt(f + 1) + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.casedate + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.caseno + '</td>'
                            + '<td>' + crimeclassification + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.complainantdetails.survivoraddress + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.complainantdetails.district.districtname + '</td>'
                            + '</tr>';
//                var freshcases_full = table_freshcases_title + tablecontent + table_freshcases_list + '</tbody></table>';
//                var table_followupcases_title = '<h4 class="my-2">Follow Up Cases List</h4>';
//                var table_followupcases_list = '';
//                for (var f = 0; f < followupcaselist.length; f++) {
//                    followupcaselist += '<tr onclick="caseindex(&quot;' + caselist[c].caseno + '&quot;)">'
//                            + '<td>' + parseInt(f + 1) + '</td>'
//                            + '<td>' + followupcaselist[f].basic_casedetails.casedate + '</td>'
//                            + '<td>' + followupcaselist[f].basic_casedetails.caseno + '</td>'
//                            + '<td></td>'
////                    + '<td>'+basic_casedetails.m_natureofcase.crimeclassification+'</td>'
//                            + '<td>' + followupcaselist[f].basic_casedetails.complainantdetails.survivoraddress + '</td>'
//                            + '<td>' + followupcaselist[f].basic_casedetails.complainantdetails.district.districtname + '</td>'
//                            + '</tr>';
                }
                var followupcases_full = table_followupcases_title + tablecontent + table_followupcases_list + '</tbody></table>';
                var modaltoocontent = '<ul class="nav nav-tabs">'
                        + ' <li class="nav-item">'
                        + ' <a href="#freshcases" class="nav-link active" data-bs-toggle="tab">Fresh Cases</a>'
                        + ' </li>'
                        + ' <li class="nav-item">'
                        + ' <a href="#followupcases" class="nav-link" data-bs-toggle="tab">Follow Up Cases</a>'
                        + ' </li>'
                        + ' </ul>'
                        + ' <div class="tab-content">'
                        + ' <div class="tab-pane fade show active" id="freshcases">'
                        + freshcases_full
                        + ' </div>'
                        + ' <div class="tab-pane fade" id="followupcases">'
                        + followupcases_full
                        + ' </div>'
                        + '</div>';
                $('#modal-content-too').html(modaltoocontent);
                var modalfootertoo = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content-too').html(modalfootertoo);
                self.close();
                myModalToo.show();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
}

function getcasesbynatureofcaseid(natureofcaseid, crimeclassification, deskid) {
    $('#managerModalSecondLabel').html('Case Detail With ' + crimeclassification);
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './getcaselistbynatureofcase.htm',
                data: 'natureofcaseid=' + natureofcaseid + '&deskid=' + deskid,
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                var caselist = JSON.parse(res.caselist);
                var followupcaselist = JSON.parse(res.followupcaselist);
                var tablecontent = '<table class="table table-striped table-bordered"><thead><th>Sl. No.</th><th>Case Date</th><th>Case No.</th><th>Crime Classification</th><th>Location</th><th>District</th></thead><tbody>';
                var table_freshcases_title = '<h4 class="my-2">Fresh Cases List</h4>';
                var table_freshcases_list = '';
                for (var c = 0; c < caselist.length; c++) {
                    var crimeclassification = caselist[c].m_natureofcase ? caselist[c].m_natureofcase.crimeclassification : '';
                    table_freshcases_list += '<tr class="fake-btn" onclick="caseindex(&quot;' + caselist[c].caseno + '&quot;)">'
                            + '<td>' + parseInt(c + 1) + '</td>'
                            + '<td>' + caselist[c].casedate + '</td>'
                            + '<td>' + caselist[c].caseno + '</td>'
                            + '<td>' + crimeclassification + '</td>'
                            + '<td>' + caselist[c].complainantdetails.survivoraddress + '</td>'
                            + '<td>' + caselist[c].complainantdetails.district.districtname + '</td>'
                            + '</tr>';
                }
                var freshcases_full = table_freshcases_title + tablecontent + table_freshcases_list + '</tbody></table>';
                var table_followupcases_title = '<h4 class="my-2">Follow Up Cases List</h4>';
                var table_followupcases_list = '';
                for (var f = 0; f < followupcaselist.length; f++) {
                    var crimeclassification = followupcaselist[f].basic_casedetails.m_natureofcase ? followupcaselist[f].basic_casedetails.m_natureofcase.crimeclassification : '';
                    table_followupcases_list += '<tr class="fake-btn" onclick="caseindex(&quot;' + followupcaselist[f].basic_casedetails.caseno + '&quot;)">'
                            + '<td>' + parseInt(f + 1) + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.casedate + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.caseno + '</td>'
                            + '<td>' + crimeclassification + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.complainantdetails.survivoraddress + '</td>'
                            + '<td>' + followupcaselist[f].basic_casedetails.complainantdetails.district.districtname + '</td>'
                            + '</tr>';
                }
                var followupcases_full = table_followupcases_title + tablecontent + table_followupcases_list + '</tbody></table>';
                var modaltoocontent = '<ul class="nav nav-tabs">'
                        + ' <li class="nav-item">'
                        + ' <a href="#freshcases" class="nav-link active" data-bs-toggle="tab">Fresh Cases</a>'
                        + ' </li>'
                        + ' <li class="nav-item">'
                        + ' <a href="#followupcases" class="nav-link" data-bs-toggle="tab">Follow Up Cases</a>'
                        + ' </li>'
                        + ' </ul>'
                        + ' <div class="tab-content">'
                        + ' <div class="tab-pane fade show active" id="freshcases">'
                        + freshcases_full
                        + ' </div>'
                        + ' <div class="tab-pane fade" id="followupcases">'
                        + followupcases_full
                        + ' </div>'
                        + '</div>';
                $('#modal-content-too').html(modaltoocontent);
                var modalfootertoo = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content-too').html(modalfootertoo);
                self.close();
                myModalToo.show();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
}

function get181cases() {
    $('#managerModalLabel').html("181 Desk");
    $('#modal-content').html('');
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './fetch181cases.htm',
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                var casecount = res.casecount;
                var districts = JSON.parse(res.districts);
                var mdesk = JSON.parse(res.mdesk);
                var modalcontent = '<div class="row"><div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Select District To Fetch Cases From 181 Desk</h4></div>';
                for (var i = 0; i < casecount.length; i++) {
                    modalcontent += '<div class="col-sm-3 my-2"><div class="card card-zoom">'
                            + '<div class="fake-btn" onclick="getcasesbydistrictcode(' + casecount[i][0] + ', &quot;' + casecount[i][1] + '&quot;, ' + mdesk.deskid.trim() + ')">'
                            + '<div class="card-header text-center text-uppercase bg-sand text-black fw-bold">' + casecount[i][1] + '</div>'
                            + '<div class="card-body text-center bg-sand">'
                            + '<p class="fw-bold text-dark">Total No. Of Cases:</p>'
                            + '<h3 class="fw-bold text-dark" id="casecount">' + casecount[i][2] + '</h3>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>';
                }
                modalcontent += '</div>';
                $('#modal-content').html(modalcontent);
                var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content').html(mfc);
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
    myModal.toggle();
}

function get181natureofcases(natureofcasetypeid) {
    $('#managerModalLabel').html("181 Desk");
    $('#modal-content').html('');
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './fetchnatureofcases.htm',
                data: 'natureofcasetypeid='+natureofcasetypeid,
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                console.log(res);
                var casecount = res.casecount;
                console.log(casecount);
                var natureofcase = JSON.parse(res.natureofcase);
                var mdesk = JSON.parse(res.mdesk);
                var modalcontent = '<div class="row"><div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Select Case Type To Fetch Cases From 181 Desk</h4></div>';
                for (var i = 0; i < casecount.length; i++) {
                    modalcontent += '<div class="col-sm-3 my-2"><div class="card card-zoom">'
                            + '<div class="fake-btn" onclick="getcasesbynatureofcaseid(' + casecount[i][0] + ', &quot;' + casecount[i][1] + '&quot;, ' + mdesk.deskid.trim() + ')">'
                            + '<div class="card-header text-center text-uppercase bg-sand text-black fw-bold">' + casecount[i][1] + '</div>'
                            + '<div class="card-body text-center bg-sand">'
                            + '<p class="fw-bold text-dark">Total No. Of Cases:</p>'
                            + '<h3 class="fw-bold text-dark" id="casecount">' + casecount[i][2] + '</h3>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>';
                }
                modalcontent += '</div>';
                $('#modal-content').html(modalcontent);
                var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content').html(mfc);
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
    myModal.toggle();
}

function getmanagercases() {
    $('#managerModalLabel').html("Cases On Manager's Desk");
    $('#modal-content').html('');
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './fetchmanagercases.htm',
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                var casecount = res.casecount;
                var districts = JSON.parse(res.districts);
                var mdesk = JSON.parse(res.mdesk);
                var modalcontent = '<div class="row"><div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Select District to fetch case from 181 Manager\'s Desk</h4></div>';
                for (var i = 0; i < casecount.length; i++) {
                    modalcontent += '<div class="col-sm-3 my-2"><div class="card card-zoom">'
                            + '<div class="fake-btn" onclick="getcasesbydistrictcode(' + casecount[i][0] + ', &quot;' + casecount[i][1] + '&quot;, ' + mdesk.deskid.trim() + ')">'
                            + '<div class="card-header text-center text-uppercase bg-sand text-black fw-bold">' + casecount[i][1] + '</div>'
                            + '<div class="card-body text-center bg-sand">'
                            + '<p class="fw-bold text-dark">Total No. Of Cases:</p>'
                            + '<h3 class="fw-bold text-dark" id="casecount">' + casecount[i][2] + '</h3>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>';
                }
                modalcontent += '</div>';
                $('#modal-content').html(modalcontent);
                var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content').html(mfc);
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
    myModal.toggle();
}

function scheduledappointmentrequests() {
    $('#managerModalLabel').html("Scheduled Appointment Requests");
    $('#modal-content').html('');
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './scheduledappointmentrequests.htm',
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                console.log(res);
                var trows = '';
                for (var c = 0; c < res.length; c++) {
                    trows += '<tr>'
                            + '<td>' + parseInt(c + 1) + '</td>'
                            + '<td>' + res[c].basic_casedetails.caseno + '</td>'
                            + '<td>' + res[c].basic_casedetails.complainantdetails.survivorname + '</td>'
                            + '<td>' + res[c].date1 + '</td>'
                            + '<td>' + res[c].master_agencydetail.m_agencytype.agencytypename + '</td>'
                            + '<td>' + res[c].master_agencydetail.agencyname + '</td>'
                            + '<td>' + res[c].appointmentreqdesc + '</td>'
                            + '</tr>';
                }
                var modalcontent = '<div class="row">'
                        + '<div class="col-sm-12 text-center mb-2">'
                        + '<div class="card">'
                        + '<div class="card-header">'
                        + '<h4 class="fw-bold">Appointment Requests</h4>'
                        + '</div>'
                        + '<div class="card-body"><table id="appointmentRequestTable" class="table table-striped table-bordered">'
                        + '<thead>'
                        + '<th>Sl. No.</th>'
                        + '<th>Case No.</th>'
                        + '<th>Victim Name</th>'
                        + '<th>Date of Appointment</th>'
                        + '<th>Agency Name</th>'
                        + '<th>Appointment With</th>'
                        + '<th>Appointment Request Description</th>'
                        + '</thead>'
                        + '<tbody>'
                        + trows
                        + '</tbody>'
                        + '</table>'
                        + '</div>'
                        + '</div>'
                        + '</div>';
                $('#modal-content').html(modalcontent);
                var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content').html(mfc);
                $('#appointmentRequestTable').DataTable();
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
    myModal.toggle();
}

function appointmentconfirmation() {
    $('#managerModalLabel').html("Appointment Confirmation Status To Survivor");
    $('#modal-content').html('');
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './appointmentconfirmation.htm',
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                console.log(res);
                var tbrows = '';
                console.log(res);
                for (var r = 0; r < res.length; r++) {
                    tbrows += '<tr>'
                            + '<td>' + parseInt(r + 1) + '</td>'
                            + '<td>' + res[r].basic_casedetails.caseno + '</td>'
//                            + '<td>' + res[r].appointmentreqid + '</td>'
                            + '<td>' + res[r].basic_casedetails.complainantdetails.survivorname + '</td>'
                            + '<td>' + res[r].date1 + '</td>'
                            + '<td>' + res[r].master_agencydetail.m_agencytype.agencytypename + '</td>'
                            + '<td>' + res[r].master_agencydetail.agencyname + '</td>'
                            + '<td>' + res[r].appointmentreqdesc + '</td>'
                            + '</tr>';
                }
                var modalcontent = '<div class="card"><div class="card-body"><div class="row"><div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Appointment Confirmation Status To Survivor</h4></div>';
                modalcontent += '<table id="confirmedAppointmentTable" class="table table-striped table-bordered">'
                        + '<thead>'
                        + '<th>Sl. No.</th>'
                        + '<th>Case No.</th>'
                        + '<th>Victim Name</th>'
                        + '<th>Date of Appointment</th>'
                        + '<th>Agency Name</th>'
                        + '<th>Appointment With</th>'
                        + '<th>Appointment Request Description</th>'
                        + '</thead>'
                        + '<tbody>'
                        + tbrows
                        + '</tbody>'
                        + '</table>'
                        + '</div></div></div>';
                $('#modal-content').html(modalcontent);
                var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content').html(mfc);
                $('#confirmedAppointmentTable').DataTable({});
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
    myModal.toggle();
}

function fillappointmentdetails() {
    $('#managerModalLabel').html("Fill Appointment Details");
    $('#modal-content').html('');
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './fillappointmentdetails.htm',
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                var agencylist = JSON.parse(res.agencylist);
//                                                            console.log(agencylist);
                var agencies = '';
                var casenos = '';
                for (var a = 0; a < agencylist.length; a++) {
                    agencies += '<option value="' + agencylist[a].agencytypeid + '">' + agencylist[a].agencytypename + '</option>';
                }
                var basic_case_details = JSON.parse(res.basic_case_details);
//                                                            console.log(basic_case_details);
                for (var b = 0; b < basic_case_details.length; b++) {
                    casenos += '<option value="' + basic_case_details[b].basic_caseid + '">' + basic_case_details[b].caseno + '</option>';
                }


                var modalcontent = '<div class="row"><div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Appointment Confirmation Status To Survivor</h4></div>';
                modalcontent += '<div class="col-sm-12">'
                        + '<div class="card">'
                        + '<div class="card-body">'
                        + '<form id="appointmentForm" autocomplete="off" class="needs-validation">'
                        + '<div class="row g-2 mb-3">'

                        + '<div class="col-md">'
                        + '<div class="form-floating">'
                        + '<select name="agencytype" class="form-select" id="inputSpecialization" aria-label="Specialization (Agency Name)" required="true">'
                        + '<option selected="true" disabled="true" value="">Select Specialization</option>'
                        + agencies
                        + '</select>'
                        + '<label for="inputSpecialization">Select Specialization</label>'
                        + '</div>'
                        + '</div>'

                        + '<div class="col-md">'
                        + '<div class="form-floating">'
                        + '<select name="magencydetail" class="form-select" id="inputAppointmentWith" aria-label="Appointment With Agency Name">'
                        + '<option selected="true" disabled="true" value="">Select Agency First</option>'
                        + '</select>'
                        + '<label for="inputAppointmentWith">Appointment With</label>'
                        + '</div>'
                        + '</div>'

                        + '<div class="col-md">'
                        + '<div class="form-floating">'
                        + '<select name="caseno" class="form-select" id="inputCaseNo" aria-label="Case No. From Basic Case Details" required="true">'
                        + '<option selected="true" disabled="true" value="">Select Case No.</option>'
                        + casenos
                        + '</select>'
                        + '<label for="inputCaseNo">Appointment Request for Case No.</label>'
                        + '</div>'
                        + '</div>'

                        + '</div>'

                        + '<div class="row g-2 mb-3">'
                        + '<div class="col-md">'
                        + '<div class="form-floating">'
                        + '<textarea name="appointmentreqdesc" class="form-control h-100" id="appointmentDetails" placeholder="Appointment Request Description" rows="7" maxlength="100"></textarea>'
                        + '<label for="appointmentDetails">Appointment Request Description</label>'
                        + '</div>'
                        + '</div>'
                        + '</div>'

                        + '<div class="row g-2 mt-1">'
                        + '<div class="col-md">'
                        + '<p>Preferred Dates</p>'
                        + '</div>'
                        + '</div>'

                        + '<div class="row g-2 mb-3">'
                        + '<div class="col-md form-floating">'
                        + '<input type="date" class="form-control" id="inputDate1" name="date1" required="true"/>'
                        + '<label for="inputDate1">Date 1</label>'
                        + '</div>'
                        + '<div class="col-md form-floating">'
                        + '<input type="date" class="form-control" id="inputDate2" name="date2" required="true"/>'
                        + '<label for="inputDate2">Date 2</label>'
                        + '</div>'
                        + '<div class="col-md form-floating">'
                        + '<input type="date" class="form-control" id="inputDate3" name="date3" required="true"/>'
                        + '<label for="inputDate3">Date 3</label>'
                        + '</div>'
                        + '<div class="col-md form-floating">'
                        + '<input type="date" class="form-control" id="inputDate4" name="date4" required="true"/>'
                        + '<label for="inputDate4">Date 4</label>'
                        + '</div>'
                        + '</div>'

                        + '<div class="row g-2 mt-4">'
                        + '<div class="col-md d-flex justify-content-end">'
                        + '<input type="submit" class="btn btn-success" value="Save Appointment Request" />'
                        + '</div>'
                        + '</div>'


                        + '</form>'
                        + '</div>'
                        + '</div>'
                        + '</div>';
//                                                                   
//
                $('#modal-content').html(modalcontent);
                var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
                $('#modal-footer-content').html(mfc);
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
    myModal.toggle();
}

function registeredcasesviamobilesms() {
    // load the initial data here and assign to the respective divs and select tags

    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './mobilesmscases.htm',
                method: 'GET'
            }).done(function (response) {
                var res = JSON.parse(response);
                var districts = JSON.parse(res.districts);
                var maritalstatus = JSON.parse(res.maritalstatus);
                var religion = JSON.parse(res.religion);
                var districtoptions = '<option value="" disabled="true" selected="true">Select District</option>';
                var maritalstatusoptions = '<option value="" disabled="true" selected="true">Select Marital Status</option>';
                var religionoptions = '<option value="" disabled="true" selected="true">Select Religion</option>';
                for (var d = 0; d < districts.length; d++) {
                    districtoptions += '<option value="' + districts[d].districtcode + '">' + districts[d].districtname + '</option>';
                }
                for (var m = 0; m < maritalstatus.length; m++) {
                    maritalstatusoptions += '<option value="' + maritalstatus[m].maritalstatusid + '">' + maritalstatus[m].maritalstatusdesc + '</option>';
                }
                for (var r = 0; r < religion.length; r++) {
                    religionoptions += '<option value="' + religion[r].religionid + '">' + religion[r].religiondesc + '</option>';
                }
                $('#inputDistrict').html(districtoptions);
                $('#inputIncidentDistrict').html(districtoptions);
                $('#inputMaritalStatus').html(maritalstatusoptions);
                $('#inputReligion').html(religionoptions);
                self.close();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });

    modalSMSCases.toggle();
}

function integratedandnonintegratedcentrecases() {
    $('#managerModalLabel').html("Integrated and Non-Integrated Centre Cases");
    $('#modal-content').html('');
    var modalcontent = '<div class="card"><div class="card-body"><div class="row mb-2">'
            + '<div class="col-sm-12 col-md-2">Name of Agency</div>'
            + '<div class="col-sm-12 col-md-7"><select id="inputAgencyNameSelect" class="form-control required"><option value="" selected="true" disabled="true">Select Agency Name</option>'
            + '<option value="I">Integrated</option>'
            + '<option value="N">Non-Integrated</option>'
            + '</select></div>'
            + '<div class="col-sm-12 col-md-3"></div>'
            + '</div><!--row-->'
            + '<div class="row">'
            + '<div class="col-sm-12 col-md-2">Cases Of</div>'
            + '<div class="col-sm-12 col-md-7"><select id="inputCasesOfSelect" class="form-control required"><option value="" selected="true" disabled="true">Select Agency Name First</option>'
            + '</select></div>'
            + '<div class="col-sm-12 col-md-3"><button id="showIntegratedNonIntegratedBTN" class="btn btn-primary w-100">Show Cases</button></div>'
            + '</div><!--row--></div></div>'
            + '<div class="mt-4 pt-2 row">'
            + '<div class="card"><div class="card-body">'
            + '<div class="col-sm-12" id="integratednonintegratedcontent">'
            + '</div></div></div>';
    +'</div>';
    $('#modal-content').html(modalcontent);
    var mfc = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
    $('#modal-footer-content').html(mfc);
    myModal.toggle();
}

function caseindex(caseno) {
    window.location.href = "casemanagement.htm?icaseno=" + caseno;
}

function callbackdesk() {
    window.location.href = "callbackdesk.htm";
}

function forwardmissedcallnumber(phoneno) {
    $('#phoneInput').val(phoneno);
    $('#phoneInput').trigger('change');
}

function olddataentry(){
    window.location.href = "olddataentry.htm";
}



