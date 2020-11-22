function add_to_cart(id)
{
  var key='product_'+id;
  var x=window.localStorage.getItem(key);
  x=x*1+1;
  window.localStorage.setItem(key,x);

  update_orders_input();
  update_orders_button();
}

function show_total_in_cart()
{
  var total=0;

  for (let i = 0; i < localStorage.length; i++)
  {
    let key = window.localStorage.key(i);
    let value = window.localStorage.getItem(key);

    if(key.indexOf('product_')==0)
      total=total*1 + value*1;
  }

  return total;
}

function cart_get_orders()
{
  var orders='';

  for (let i = 0; i < localStorage.length; i++)
  {
    let key = window.localStorage.key(i);
    let value = window.localStorage.getItem(key);

    if(key.indexOf('product_')==0)
      orders = orders + key + '=' + value + ';';
  }

  return orders;
}

function update_orders_input()
{
  var orders=cart_get_orders();
  $('#orders_input').val(orders);
}

function update_orders_button()
{
  var text = 'Корзина(' + show_total_in_cart() + ')';
  $('#orders_button').val(text);
}

function clear_cart()
{
  window.localStorage.clear();
}

function cancel_order()
{
    clear_cart();
    update_orders_input();
    update_orders_button();
    $('#cart').text('Ваша корзина очищена.');
}
