import '../data/verb_data.dart';

class VerbConjugator {
  static String toMasu(VerbModel verb) {
    if (verb.group == 3) {
      if (verb.dictionary == 'くる') return 'きます';
      if (verb.dictionary.endsWith('する')) return verb.dictionary.replaceAll('する', 'します');
    }
    
    if (verb.group == 2) {
      // Remove 'ru' add 'masu'
      return verb.dictionary.substring(0, verb.dictionary.length - 1) + 'ます';
    }
    
    // Group 1
    final lastChar = verb.dictionary.substring(verb.dictionary.length - 1);
    final stem = _getStem(verb.dictionary);
    return stem + 'ます';
  }

  static String toTe(VerbModel verb) {
    if (verb.group == 3) {
      if (verb.dictionary == 'くる') return 'きて';
      if (verb.dictionary.endsWith('する')) return verb.dictionary.replaceAll('する', 'して');
    }

    if (verb.group == 2) {
      return verb.dictionary.substring(0, verb.dictionary.length - 1) + 'て';
    }

    // Group 1
    final stem = verb.dictionary.substring(0, verb.dictionary.length - 1);
    final lastChar = verb.dictionary.substring(verb.dictionary.length - 1);

    if (['う', 'つ', 'る'].contains(lastChar)) return '$stemって';
    if (['む', 'ぶ', 'ぬ'].contains(lastChar)) return '$stemんで';
    if (lastChar == 'く') return (verb.dictionary == 'いく') ? 'いって' : '$stemいて';
    if (lastChar == 'ぐ') return '$stemいで';
    if (lastChar == 'す') return '$stemして';

    return verb.dictionary; // Fallback
  }

  static String toTa(VerbModel verb) {
    final teForm = toTe(verb);
    return teForm.substring(0, teForm.length - 1) + (teForm.endsWith('て') ? 'た' : 'だ');
  }

  static String toNai(VerbModel verb) {
    if (verb.group == 3) {
      if (verb.dictionary == 'くる') return 'こない';
      if (verb.dictionary.endsWith('する')) return verb.dictionary.replaceAll('する', 'しない');
    }

    if (verb.group == 2) {
      return verb.dictionary.substring(0, verb.dictionary.length - 1) + 'ない';
    }

    // Group 1
    final lastChar = verb.dictionary.substring(verb.dictionary.length - 1);
    final stem = verb.dictionary.substring(0, verb.dictionary.length - 1);
    
    String aStem;
    if (lastChar == 'う') aStem = 'わ';
    else if (lastChar == 'く') aStem = 'か';
    else if (lastChar == 'ぐ') aStem = 'が';
    else if (lastChar == 'す') aStem = 'さ';
    else if (lastChar == 'つ') aStem = 'た';
    else if (lastChar == 'ぬ') aStem = 'な';
    else if (lastChar == 'ぶ') aStem = 'ば';
    else if (lastChar == 'む') aStem = 'ま';
    else if (lastChar == 'る') aStem = 'ら';
    else aStem = '';

    return stem + aStem + 'ない';
  }

  static String _getStem(String dictionary) {
    final lastChar = dictionary.substring(dictionary.length - 1);
    final base = dictionary.substring(0, dictionary.length - 1);
    
    switch (lastChar) {
      case 'う': return '${base}い';
      case 'く': return '${base}き';
      case 'ぐ': return '${base}ぎ';
      case 'す': return '${base}し';
      case 'つ': return '${base}ち';
      case 'ぬ': return '${base}に';
      case 'ぶ': return '${base}び';
      case 'む': return '${base}み';
      case 'る': return '${base}り';
      default: return base;
    }
  }
}
