function something()
{
  var x=window.localStorage.getItem('bbb');
  x=x*1+1;
  window.localStorage.setItem('bbb', x);
  alert(x);
}

function add_to_cart(id)
{
  var key='product_'+id;
  var x=window.localStorage.getItem(key);
  x=x*1+1;
  window.localStorage.setItem(key,x);
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

  alert(total);
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
