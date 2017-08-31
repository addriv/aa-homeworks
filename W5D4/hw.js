function madLib(verb, adjective, noun){
  console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`);
}

function isSubstring(searchString, word){
  return searchString.includes(word);
}

function fizzBuzz(array){
  const fizzBuzzArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)){
      fizzBuzzArr.push(el);
    }
  });

  return fizzBuzzArr;
}

function isPrime(num){
  if (num < 2 ) { return false; }

  for (let i = 2; i < num; i++){
    if (num % i == 0) { return false; }
  }

  return true;
}

function sumOfNPrimes(n){
  let total = 0;
  let primes = 0;
  let i = 2;

  while (primes < n) {
    if (isPrime(i)){
      total += i;
      primes += 1;
    }
    i++;
  }

  return total;
}

function titleize(names, callback){
  let titleized = names.map(name => `Mx ${name} Jingleheimer Schmidt`)
  callback(titleized);
};
