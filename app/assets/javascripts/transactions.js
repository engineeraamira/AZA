//= require jquery-3.5.1
//= require datatables/jquery.dataTables.min

$(document).ready(function () {
    if(window.location.href == "http://localhost:3000/transactions" || window.location.href == "http://localhost:3000/"){
        $('#transactions').DataTable({
            ajax: '/transactions.json',
        });
    }

    $("#add_transaction").on("click",(function(e){
        e.preventDefault();
        var elements = new FormData($('#transactions_form')[0]);
        $.ajax({
            type: "POST",
            url: "/transactions",
            data: elements,
            //async: false,
            cache: false,
            contentType: false,
            processData: false,
            dataType: "JSON",
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            complete: function () {
                
            },
            error: function (xhr, ajaxOptions, thrownError) {
                var obj = thrownError;
                var stringerror = '';
                for (var prop in obj) {
                    stringerror += '* ' + obj[prop] + '</br>';
                }
                console.log(stringerror);
            },
            success: function (response)
            {
                if (response !== null && response["status"] == false) {
                    var obj = response["msg"];
                    var stringerror = '';
                    for (var prop in obj) {
                        stringerror += '* ' + prop + ' ' + obj[prop] + '  ';
                    }
                    alert(stringerror);
                    
                } else {
                    // var obj = response;
                    // var stringerror = '';
                    // for (var prop in obj) {
                    //     stringerror += '* ' + prop + ' ' + obj[prop] + '  ';
                    // }
                    //alert(stringerror);
                    window.location.href = response["url"];
                }
            }
        })

    }));
});