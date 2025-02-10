// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "./calendar";

document.addEventListener('DOMContentLoaded', () => {
  const prevMonth = document.getElementById("prev-month");
  const nextMonth = document.getElementById("next-month");
  let currentMonth = document.getElementById("current-month");
  let currentYear = document.getElementById("current-year");

  const months = [
    "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
  ];


  function sendDateRequest(startDate, endDate) {
    const url = `/transactions?start_date=${startDate}&end_date=${endDate}`

    fetch(url, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    });
  }

  function updateDisplayedDate(month, year) {
    currentMonth.style.opacity = 0;
    currentYear.style.opacity = 0;

    setTimeout(() => {
      currentMonth.textContent = months[month]
      currentYear.textContent = year;

      currentMonth.style.opacity = 1;
      currentYear.style.opacity = 1;
    }, 100);
  }

  prevMonth.addEventListener('click', () => {
    let month = months.indexOf(currentMonth.textContent.trim());
    let year = parseInt(currentYear.textContent.trim());
    const january = 0;
    const december = 11;

    if (month === january) {
      month = december;
      year--;
    } else {
      month--;
    }

    const startDate = new Date(year, month, 1)
    const endDate = new Date(year, month + 1, 0)


    sendDateRequest(startDate, endDate)
    updateDisplayedDate(month, year)
  })


  nextMonth.addEventListener('click', () => {
    let month = months.indexOf(currentMonth.textContent.trim());
    let year = parseInt(currentYear.textContent.trim());
    const december = 11
    const january = 0

    if (month === december) {
      month = january;
      year ++;
    } else {
      month ++;
    }

    const startDate = new Date(year, month, 1)
    const endDate = new Date(year, month + 1, 0)

    sendDateRequest(startDate, endDate)
    updateDisplayedDate(month, year)
  })

})
