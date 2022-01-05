jQuery(function () {
  //data table of article and Category

  lengthMenu = $(".data-table-div").data("lengthMenu");
  zeroRecords = $(".data-table-div").data("zeroRecords");
  info = $(".data-table-div").data("info");
  infoEmpty = $(".data-table-div").data("infoempty");
  infoFiltered = $(".data-table-div").data("infoFiltered");
  search = $(".data-table-div").data("search");

  // Custom filtering function which will search data in column four between two values
  $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
    var min_date = $("#min").val();
    console.log(min_date);
    var min = new Date(String(min_date));
    console.log(min);
    var max_date = $("max").val();
    var max = new Date(String(max_date));

    var startDate = new Date(data[2]);

    //window.confirm(startDate);
    if (!min_date && !max_date) {
      return true;
    }
    if (!min_date && startDate <= max) {
      return true;
    }
    if (!max_date && startDate >= min) {
      return true;
    }
    if (startDate <= max && startDate >= min) {
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

  $("#min, #max").on("change", function () {
    table.draw();
  });
  //category actions

  $("#list-category").on("click", ".delete-categ", function () {
    slugCateg = $(this).data("slugCateg");
    labelCateg = $(this).data("labelLocal");
    $(".modal .confirm").addClass("confirme-delete");
    $(".var-message").text(labelCateg);

    $(".confirme-delete").on("click", function (e) {
      $.ajax({
        url: "/adminsicad/delete-category/" + slugCateg,
        data: { slugCateg: slugCateg },
        method: "post",
        success: function (data) {
          if (data === "done") {
            $("#" + slugCateg)
              .closest(".row-categ")
              .remove();
          }
        },
        error: function (data) {
          if (data === "impossible") {
            messageError = $("#" + slugCateg).data("deleteError");
            $(".modal-message").text(messageError);
            $("#modal-default").modal("show");
          }
        },
      });
    });
  });

  //Article actions

  //delete Article from datatable
  $("#list-article").on("click", ".delete-article", function () {
    slugArticle = $(this).parent(".datatable-action").attr("id");
    titleArticle = $(this).data("titleArticle");

    $(".modal .confirm").addClass("confirme-delete");
    $(".var-message").text(titleArticle);

    $(".confirme-delete").on("click", function (e) {
      $.ajax({
        url: "/adminsicad/delete-article/" + slugArticle,
        data: { slugArticle: slugArticle },
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

  //Validate Article from datatable

  $("#list-article").on("click", ".validate-article", function (e) {
    e.preventDefault();
    slugArticle = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/validate-article/" + slugArticle,
      data: { slugArticle: slugArticle },
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

  //Publish Article from datatable
  $("#list-article").on("click", ".publish-article", function (e) {
    e.preventDefault();
    slugArticle = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/publish-article/" + slugArticle,
      data: { slugArticle: slugArticle },
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
});
