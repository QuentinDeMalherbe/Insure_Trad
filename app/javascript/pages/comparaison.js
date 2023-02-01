
const changeSelect = (value) => {
  document.getElementById('prime').innerHTML = document.getElementById('prime').getAttribute(value);
  document.getElementById('r_1').innerHTML = document.getElementById('r_1').getAttribute(value);
  document.getElementById('r_2').innerHTML = document.getElementById('r_2').getAttribute(value);
  document.getElementById('r_3').innerHTML = document.getElementById('r_3').getAttribute(value);
  document.getElementById('grade_b').innerHTML = document.getElementById('grade_b').getAttribute(value);
  changeUrl(value);
};

const changeUrl = (value) => {
  const url = document.getElementById('normalQuote').href
  document.getElementById('customQuote').href = url + `?chosen=${value}`
};

export { changeSelect }
