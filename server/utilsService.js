const convertAmountToWords = (amount) => {
    const units = ['', 'Un', 'Deux', 'Trois', 'Quatre', 'Cinq', 'Six', 'Sept', 'Huit', 'Neuf'];
    const teens = ['', 'Onze', 'Douze', 'Treize', 'Quatorze', 'Quinze', 'Seize', 'Dix-Sept', 'Dix-Huit', 'Dix-Neuf'];
    const tens = ['', 'Dix', 'Vingt', 'Trente', 'Quarante', 'Cinquante', 'Soixante', 'Soixante-Dix', 'Quatre-Vingt', 'Quatre-Vingt-Dix'];
    const thousands = ['', 'Mille', 'Million', 'Milliard'];

    const numToWords = num => {
        if (num === 0) return '';
        if (num < 10) return units[num];
        if (num < 20) return teens[num - 10];
        if (num < 100) return tens[Math.floor(num / 10)] + (num % 10 !== 0 ? '-' + numToWords(num % 10) : '');
        return units[Math.floor(num / 100)] + ' Cent' + (num % 100 !== 0 ? ' ' + numToWords(num % 100) : '');
    };

    if (amount === 0) return 'Zéro';
    let result = '';
    let thousandsIndex = 0;

    while (amount > 0) {
        if (amount % 1000 !== 0) {
        result = numToWords(amount % 1000) + ' ' + thousands[thousandsIndex] + ' ' + result;
        }
        thousandsIndex++;
        amount = Math.floor(amount / 1000);
    }

    return result.trim();
};

module.exports = {
    convertAmountToWords
  };