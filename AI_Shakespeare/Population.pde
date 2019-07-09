public class Population {
  private int size;
  private int len;
  private Phrase[] population;
  private String goal;
  private int genNum;
  
  public Population(int popSize, int phraseLen, String goalPhrase) {
    size = popSize;
    len = phraseLen;
    goal = goalPhrase;
    
    population = new Phrase[size];
    generatePop();
    
    genNum = 0;
  }
  
  //************************************************************
  
  public void generatePop() {
    for (int i = 0; i < size; i++) {
      population[i] = new Phrase(len);
    }
  }
  
  public void displayGen() {
    delay(100);
    background(0);
    fill(255);
    
    textSize(40);
    text("Generation " + genNum + ":\n", width / 2, 75);
    
    textSize(15);
    text("Average fitness: " + avgFit()/* + " (" + (avgFit() / (int) pow(2, goal.length())) + "%)"*/, width / 2, 100);
    
    textSize(20);
    
    for (int i = 0; i < size; i++) {
      boolean halfway = i >= size / 2;
      text(i+".." + population[i].phrase + ": " + population[i].calcFitness(goal) + "\n", (!halfway)? 200: width - 200, 150+(20*(i - ((!halfway)? 0: 25))));
    }
  }
  
  public boolean checkGoal() {
    displayGen();
    
    for (int i = 0; i < size; i++)
      if (population[i].phrase.equals(goal)) {
        return true;
      }
    
    makeNextGen();
    return false;
  }
  
  public void makeNextGen() {
    ArrayList<Phrase> matingPool = new ArrayList<Phrase>();
    
    for (int i = 0; i < size; i++) {
      int fitness = population[i].calcFitness(goal);
      
      for (int j = 0; j < fitness; j++)
        matingPool.add(population[i]);
    }
    
    Phrase[] newPop = new Phrase[size];
    
    for (int i = 0; i < size; i++) {
      int rand1 = (int) random(matingPool.size());
      int rand2 = (int) random(matingPool.size());
      newPop[i] = child(matingPool.get(rand1), matingPool.get(rand2));
    }
    
    population = newPop;
    genNum++;
  }
  
  public Phrase child(Phrase p1, Phrase p2) {
    int midpoint = p1.len / 2;
    
    return new Phrase(p1.phrase.substring(0, midpoint) + p2.phrase.substring(midpoint, p2.len));
  }
  
  public int avgFit() {
    int result = 0;
    
    for (int i = 0; i < size; i++)
      result += population[i].calcFitness(goal);
      
    return result / size;
  }
}
