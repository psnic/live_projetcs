/*!
 * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
 */
// 
// Scripts
// 
            function addRow() {
    var gridContainer = document.getElementById("gridContainer");

    // Create a new row div
    var newRow = document.createElement("div");
    newRow.classList.add("row", "grid-row");

    // Create a select dropdown for infrastructure
    var selectDropdown = document.createElement("select");
    selectDropdown.classList.add("form-control");
    selectDropdown.name = "infrastructure[]";

    // Add a default option
    var defaultOption = document.createElement("option");
    defaultOption.value = "-1";
    defaultOption.textContent = "--Select--";
    selectDropdown.appendChild(defaultOption);

    // Fetch infrastructure data using jQuery's $.ajax()
    $.ajax({
        url: './getAllInfrastructures.htm',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            data.forEach(infrastructure => {
                var option = document.createElement("option");
                option.value = infrastructure.infrastructure_id;
                option.textContent = infrastructure.infrastructure_name;
                selectDropdown.appendChild(option);
            });

            // Create the rest of the columns for the new row
            var selectColumn = document.createElement("div");
            selectColumn.classList.add("col-md-5", "mt-2");
            selectColumn.appendChild(selectDropdown);

            var inputColumn = document.createElement("div");
            inputColumn.classList.add("col-md-2", "mt-2");
            inputColumn.innerHTML = '<input type="text" class="form-control onlyDigits" placeholder="Total No." name="damagedInfra[]">';

            var deleteColumn = document.createElement("div");
            deleteColumn.classList.add("col-md-2", "mt-2");
            deleteColumn.innerHTML = '<button type="button" class="btn btn-danger delete-button" onclick="deleteRow(this)">Delete</button>';

            // Append columns to the new row
            newRow.appendChild(selectColumn);
            newRow.appendChild(inputColumn);
            newRow.appendChild(deleteColumn);

            // Append the new row to the grid container
            gridContainer.appendChild(newRow);
        },
        error: function(error) {
            console.error("Error fetching infrastructure data:", error);
        }
    });
}

                                                            // Function to delete a row from the grid
                                                            function deleteRow(button) {
                                                                const gridRow = button.closest(".grid-row");
                                                                gridRow.remove();
                                                            }
