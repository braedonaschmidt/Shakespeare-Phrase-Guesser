public class Phrase {
  private int len;
  private String phrase;
  private float MUTATION_RATE = 1; //percent
  
  public Phrase(int length) {
    len = length;
    phrase = randStr();
  }
  
  public Phrase(String str) {
    len = str.length();
    phrase = str;
    
    mutate();
  }
  
  //*************************************************************
  
  public String randStr() {
    String result = "";
    
    for (int i = 0; i < len; i++) {
      result += randChar();
    }
    
    return result;
  }
  
  public char randChar() {
    char c = (char) int(random(96, 123));
    if (c == '`') c = ' ';
    return c;
  }
  
  public int calcFitness(String goal) {
    int result = 0;
    
    for (int i = 0; i < len; i++)
      if (phrase.charAt(i) == goal.charAt(i))
        result++;
    
    return (int) pow(2, result);
  }
  
  public void mutate() {
    for (int i = 0; i < len; i++) {
      int rand = (int) random(100) + 1;
      
      if (rand <= MUTATION_RATE)
        phrase = phrase.substring(0, i) + randChar() + phrase.substring(i + 1, len);
    }
  }
}
