jQuery(function () {
  //data table of article and Category

  lengthMenu = $(".data-table-div").data("lengthMenu");
  zeroRecords = $(".data-table-div").data("zeroRecords");
  info = $(".data-table-div").data("info");
  infoEmpty = $(".data-table-div").data("infoempty");
  infoFiltered = $(".data-table-div").data("infoFiltered");
  search = $(".data-table-div").data("search");

  // Custom filtering function which will search data in column four between two values of date
  $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
    var min_date = $("#min").val();
    var min = new Date(String(min_date));

    var max_date = $("#max").val();
    var max = new Date(String(max_date));

    var date = new Date(data[2]);

    //window.confirm(startDate);
    if (!min_date && !max_date) {
      return true;
    }
    if (!min_date && date <= max) {
      return true;
    }
    if (!max_date && date >= min) {
      return true;
    }
    if (date <= max && date >= min) {
      return true;
    }
    return false;
  });

  var table = $(".liste-item").DataTable({
    columnDefs: [
      { width: 200, targets: "title-article-th" },
      { width: 100, targets: "title-categ-th" },
      { width: 50, targets: "date-article-th" },
      { width: 50, targets: "action-article-th" },
      { width: 70, targets: "datc-user-th" },
      { width: 150, targets: "role-user-th" },
      { width: 50, targets: "active-user-th" },
      { width: 100, targets: "name-user-th" },
    ],
    paging: true,
    language: {
      lengthMenu: "Display _MENU_ " + lengthMenu,
      zeroRecords: zeroRecords,
      info: info + " _PAGE_ of _PAGES_",
      infoEmpty: infoEmpty,
      infoFiltered: "(" + infoFiltered + " _MAX_ total records)",
      search: search,

      oPaginate: {
        sNext: '<i class="fas fa-angle-right"></i>',
        sPrevious: '<i class="fas fa-angle-left"></i>',
        sFirst: '<i class="fa fa-step-backward"></i>',
        sLast: '<i class="fa fa-step-forward"></i>',
      },
    },
  });
  //filter data by category when select liste of categories change
  $("#filter-categ").on("change", function () {
    table.columns(1).search(this.value).draw();
  });
  //filter data by date when datepicker range change
  $("#min, #max").on("change", function () {
    table.draw();
  });

  //Reset the Filter OF DATATABLE
  $("#reset-filer").on("click", function () {
    $("#min, #max,#filter-categ").val("");
    $("#min, #max,#filter-categ").trigger("change");
  });

  //Activate\Deactivate category action FROM DATATABLE

  $("#list-category").on("click", ".activate-action-categ", function (e) {
    e.preventDefault();
    slugCateg = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/activate-category/" + slugCateg,
      data: { slugCateg },
      method: "post",
      success: function (data) {
        if (data === true) {
          $("#" + slugCateg + " .activate-action-categ  i")
            .removeClass("desactivate-categ")
            .addClass("activate-categ");
        } else if (data === false) {
          $("#" + slugCateg + " .activate-action-categ i")
            .removeClass("activate-categ")
            .addClass("desactivate-categ");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });

  //Article actions

  //Delete Article action  FROM DATATABLE
  $("#list-article").on("click", ".delete-article", function () {
    slugArticle = $(this).parent(".datatable-action").attr("id");
    titleArticle = $(this).data("titleArticle");

    $(".modal .confirm").addClass("confirme-delete");
    $(".var-message").text(titleArticle);

    $(".confirme-delete").on("click", function (e) {
      $.ajax({
        url: "/adminsicad/delete-article/" + slugArticle,
        data: { slugArticle },
        method: "post",
        success: function (data) {
          if (data === "done") {
            $("#" + slugArticle)
              .closest(".row-item")
              .remove();
          }
        },
        error: function (data) {
          if (data === "impossible") {
            messageError = $("#" + slugArticle).data("deleteError");
            $(".modal-message").text(messageError);
            $("#modal-default").modal("show");
          }
        },
      });
    });
  });

  //Validate\Invalidate Article action  FROM DATATABLE

  $("#list-article").on("click", ".validate-article", function (e) {
    e.preventDefault();
    slugArticle = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/validate-article/" + slugArticle,
      data: { slugArticle },
      method: "post",
      success: function (data) {
        if (data === true) {
          $("#" + slugArticle + "  .validate-article i")
            .removeClass("invalid-article")
            .addClass("valid-article");
        } else if (data === false) {
          $("#" + slugArticle + "  .validate-article i")
            .removeClass("valid-article")
            .addClass("invalid-article");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });

  //Publish\Inpublish Article  FROM DATATABLE
  $("#list-article").on("click", ".publish-article", function (e) {
    e.preventDefault();
    slugArticle = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/publish-article/" + slugArticle,
      data: { slugArticle },
      method: "post",
      success: function (data) {
        if (data === true) {
          $("#" + slugArticle + "  .publish-article i")
            .removeClass("inpublish-article")
            .addClass("publish-article");
        } else if (data === false) {
          $("#" + slugArticle + "  .publish-article i")
            .removeClass("publish-article")
            .addClass("inpublish-article");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });

  // activate users FROM DATATABLE

  $("#list-users").on("click", ".activate-user", function (e) {
    e.preventDefault();
    slugUser = $(this).closest(".row-user").attr("id");
    $.ajax({
      url: "/adminsicad/activate-user/" + slugUser,
      data: { slugUser },
      method: "post",
      success: function (data) {
        if (data === true) {
          $("#" + slugUser + " .activate-user i")
            .removeClass("inactif-user")
            .addClass("actif-user");
        } else if (data === false) {
          $("#" + slugUser + " .activate-user i")
            .removeClass("actif-user")
            .addClass("inactif-user");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });

  // modifate role users FROM DATATABLE

  $("#list-users").on("change", ".select-role", function (e) {
    e.preventDefault();
    slugUser = $(this).closest(".row-user").attr("id");
    roleUser = $(this).val();
    console.log(slugUser, roleUser);
    $.ajax({
      url: "/adminsicad/modify-role-user/" + slugUser,
      data: {
        slugUser,
        roleUser,
      },
      method: "post",
      success: function (data) {
        if (data === true) {
          $("#" + slugUser + " .activate-user i")
            .removeClass("inactif-user")
            .addClass("actif-user");
        } else if (data === false) {
          $("#" + slugUser + " .activate-user i")
            .removeClass("actif-user")
            .addClass("inactif-user");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });
});
