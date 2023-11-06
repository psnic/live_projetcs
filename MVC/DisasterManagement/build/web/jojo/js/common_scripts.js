var myModal = new bootstrap.Modal(document.getElementById('beneficiaryModal'));
function loadBeneficiaries(fir_no, reportid) {
    $('#beneficiaryModalLabel').html('Beneficiary Details of FIR: ' + fir_no)
    $.confirm({
        content: function () {
            var self = this;
            return $.ajax({
                url: './getbeneficiaries.htm',
                data: 'fir_no=' + fir_no + '&reportid=' + reportid,
                method: 'GET'
            }).done(function (response) {
                console.log(response);
                var tablecontent = '<table id="benTable" class="table table-striped table-bordered"><thead>' +
                        '<th>Sl. No.</th><th>Beneficiary Name</th><th>Age</th><th>Gender</th><th>Block</th><th>Village</th><th>Bank Name</th>' +
                        '<th>Branch Name</th><th>IFSC</th><th>Account No.</th><th>Calamity</th><th>Assistance</th><th>Amount</th></thead><tbody>';
                var table_title = '<h4 class="my-2"></h4>';
                var table_list = '';
                for (var i = 0; i < response.length; i++) {
                    var age_category = response[i][3] === 'M' ? 'Male' : response[i][3] === 'F' ? 'Female' : 'Other';
                    table_list += '<tr>'
                            + '<td>' + parseInt(i + 1) + '</td>'
                            + '<td>' + response[i][1] + '</td>'
                            + '<td>' + response[i][2] + '</td>'
                            + '<td>' + age_category + '</td>'
                            + '<td>' + response[i][5] + '</td>'
                            + '<td>' + response[i][6] + '</td>'
                            + '<td>' + response[i][7] + '</td>'
                            + '<td>' + response[i][8] + '</td>'
                            + '<td>' + response[i][9] + '</td>'
                            + '<td>' + response[i][10] + '</td>'
                            + '<td>' + response[i][11] + '</td>'
                            + '<td>' + response[i][12] + '</td>'
                            + '<td>' + response[i][13] + '</td>'
                            + '</tr>';
                }
                var table_full = table_title + tablecontent + table_list + '</tbody></table>';
                $('#modal-content').html(table_full);
                $('#benTable').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bInfo": true,
                    "bAutoWidth": true});
                self.close();
                myModal.show();
            }).fail(function () {
                self.setTitle('Error!');
                self.setContent('Something went wrong.');
            });
        }
    });
}