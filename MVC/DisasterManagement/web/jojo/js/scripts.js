/*!
    * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2023 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});

document.addEventListener("DOMContentLoaded", function() {
        var dropdownTrigger = document.getElementById("navbarDropdown");
        dropdownTrigger.addEventListener("click", function(event) {
            event.preventDefault();
            var dropdownMenu = document.querySelector(".dropdown-menu");
            dropdownMenu.classList.toggle("show");
        });

        // Close the dropdown when clicking outside
        window.addEventListener("click", function(event) {
            var dropdownMenu = document.querySelector(".dropdown-menu");
            if (!event.target.matches(".dropdown-toggle")) {
                if (dropdownMenu.classList.contains("show")) {
                    dropdownMenu.classList.remove("show");
                }
            }
        });
    });
    
    function addInfraRow() {
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

    // Fetch infrastructure data using AJAX
    fetch("/getAllInfrastructures.htm")
        .then(response => response.json())
        .then(data => {
            data.forEach(infrastructure => {
                var option = document.createElement("option");
                option.value = infrastructure.infrastructure_id;
                option.textContent = infrastructure.infrastructure_name;
                selectDropdown.appendChild(option);
            });
        })
        .catch(error => console.error("Error fetching infrastructure data:", error));

    // Create the rest of the columns for the new row
    var inputColumn = document.createElement("div");
    inputColumn.classList.add("col-md-2", "mt-2");
    inputColumn.innerHTML = '<input type="text" class="form-control onlyDigits" name="damagedInfra[]">';

    var deleteColumn = document.createElement("div");
    deleteColumn.classList.add("col-md-2", "mt-2");
    deleteColumn.innerHTML = '<button type="button" class="btn btn-danger delete-button" onclick="deleteRow(this)">Delete</button>';

    // Append columns to the new row
    newRow.appendChild(selectColumn);
    newRow.appendChild(inputColumn);
    newRow.appendChild(deleteColumn);

    // Append the new row to the grid container
    gridContainer.appendChild(newRow);
}

                                                            // Function to delete a row from the grid
                                                            function deleteRow(button) {
                                                                const gridRow = button.closest(".grid-row");
                                                                gridRow.remove();
                                                            }
