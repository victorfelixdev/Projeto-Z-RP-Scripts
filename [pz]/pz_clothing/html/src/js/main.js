let prefix, category, sex, variation, id;

function sendData(data, url) {
  $.post('http://pz_clothing/' + url, JSON.stringify(data))
}

function selectPreview(data) {
  $('#variationId').html(variation);
  variation = 0
  category = data.category
  sex = data.sex
  id = data.id

  id = {
    variation: variation,
    category: data.category,
    sex: data.sex,
    id: data.id
  }

  $('#colorSelection').show();
  sendData(id, 'previewClothing');
}

function selectVariation() {
  data = {
    variation: variation,
    category: category,
    sex: sex,
    id: id.id
  }
  sendData(data, 'previewClothing');
}

$('#downColor').click(() => {
  if (variation !== 0) {
    variation--;
  }
  $('#variationId').html(variation)
  selectVariation()
})
$('#upColor').click(() => {
  if (variation < 25) {
    variation++;
  }
  $('#variationId').html(variation)
  selectVariation()
})

$('#saveClothing').click(() => {
  data = {
    variation,
    category,
    sex,
    id: id.id
  }
  sendData(data, 'saveClothing')
  variation = 0
})

$(document).ready(function () {
  window.addEventListener("message", function (event) {

    $('#colorSelection').hide();

    let data = event.data.type;
    let value = event.data.content;
    let extras = event.data.extras;
    if (data == 'showMenu' && value == true) {
      $('#itemContainer').html('')
      $('#variationId').html(variation)
      if (extras.whitelist.length > 0) {
        extras.whitelist.forEach((item) => {
          if (!extras.blacklist.includes(item)) {
            $(`
              <div class="item" onClick="selectPreview({
                category: '${extras.category}', 
                sex: '${extras.sex}', 
                id: '${item}'
              })">
                <img src="https://assets.projetozrp.com/roupas/v2/${extras.sex}_${extras.category}_${item}.png" alt="item">
                <div class="item-index">${item}</div>
              </div>
            `).appendTo('#itemContainer')
          }
        });
      } else {
        for (let i = 0; i < extras.max; i++) {
          if (!extras.blacklist.includes(i)) {
            $(`
              <div class="item" onClick="selectPreview({
                category: '${extras.category}', 
                sex: '${extras.sex}', 
                id: '${i}'
              })">
                <img src="https://assets.projetozrp.com/roupas/v2/${extras.sex}_${extras.category}_${i}.png" alt="item">
                <div class="item-index" >${i}</div>
              </div>
            `).appendTo('#itemContainer')
          }
        }
      }

      $("body").css('display', 'flex');
    }

    if (data == 'showMenu' && value == false) {
      $("body").css('display', 'none');
    }

    document.onkeyup = function (data) {
      if (data.which == 27) {
        $('body').hide(200);
        $.post('http://pz_clothing/close', JSON.stringify({}));
      }
    }
  })
});


