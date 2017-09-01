const readline = require('readline');

// window.setTimeout(() => {
//   alert('HAMMER TIME!');
// }, 5000);
//
// function hammerTime(time){
//   window.setTimeout(() => {
//     alert(`${time} is hammertime!`);
//   }, 5000);
// }

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(){
  let first, second;

  reader.question('Would you like tea?', (res1) => {
    reader.question(`Would you like buscuits?`, (res2) => {
      // second = res2;
      console.log(`You replid ${res1.toLowerCase()}`);
      console.log(`You replied ${res2.toLowerCase()}`);

      const firstAns = (res1.toLowerCase() === 'yes') ? 'do' : 'don\'t';
      const secondAns = (res2.toLowerCase() === 'yes') ? 'do' : 'don\'t';

      console.log(
        `So you ${firstAns} want tea and you ${secondAns} want coffee.`
      );

      reader.close();
  });
});}


teaAndBiscuits();
