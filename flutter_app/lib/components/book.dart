import 'dart:convert';
import 'dart:math';

List<Book> books = Book.getBooks();
var bookIndexList =
    shuffle(List<int>.generate(books.length, (int index) => index));

class Book {
  String title;
  String author;
  List<String> quotes;
  int _bookIndex = 0;
  Book({required this.title, required this.author, required this.quotes});
  late var quotesIndexList =
      shuffle(List<int>.generate(this.quotes.length, (int index) => index));

  static Book getRandomBook() {
    print("book index list: $bookIndexList");
    return books[Random().nextInt(books.length)]; // TODO: prevent repitition
  }

  String getRandomQuote() {
    return this.quotes[Random().nextInt(quotes.length)]; //without this??
  }

  static List<Book> getBooks() {
    var tempDict = jsonDecode(
      booksJsonString,
    );
    List<Book> books = [];
    List<String> quotes = [];
    for (int c1 = 0, c2 = 1;
        c1 < tempDict.length && c2 < tempDict.length;
        c1++, c2++) {
      Map bookDict1 = tempDict[c1.toString()];
      Map bookDict2 = tempDict[c2.toString()];
      quotes.add(bookDict1['Quote']);
      if (bookDict1['Title'] != bookDict2['Title']) {
        books.add(Book(
            title: bookDict1['Title'],
            author: bookDict1['Author'],
            quotes: quotes));
        quotes = [];
      }
      if (c2 + 1 == tempDict.length) {
        quotes.add(bookDict2['Quote']);
        books.add(Book(
            title: bookDict2['Title'],
            author: bookDict2['Author'],
            quotes: quotes));
        quotes = [];
      }
    }
    for (int i = 0; i < books.length; i++) {
      print("${books[i].title}, ${books[i].author}, ${books[i].quotes}");
    }
    return books;
  }

  void nextQuote() {
    _bookIndex++;
  }

  String getQuote() {
    return '7';
  }
}

List shuffle(List array) {
  var random = Random(); //import 'dart:math';

  // Go through all elementsof list
  for (var i = array.length - 1; i > 0; i--) {
    // Pick a random number according to the lenght of list
    var n = random.nextInt(i + 1);
    var temp = array[i];
    array[i] = array[n];
    array[n] = temp;
  }
  return array;
}

var booksJsonString = r'''{
  "0": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "Maybe self-improvement isn't the answer, maybe self-destruction is the answer."
  },
  "1": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "It's only after we've lost everything that we're free to do anything."
  },
  "2": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"Without their death, their pain, without their sacrifice... we would have nothing.\""
  },
  "3": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"You just do your little job\""
  },
  "4": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "In a hundred cities, fight club goes on without me."
  },
  "5": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "Maybe self-improvement isn't the answer, maybe self-destruction is the answer."
  },
  "6": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "It's only after we've lost everything that we're free to do anything."
  },
  "7": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"Without their death, their pain, without their sacrifice... we would have nothing.\""
  },
  "8": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"You just do your little job\""
  },
  "9": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "In a hundred cities, fight club goes on without me."
  },
  "10": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "The fifth rule of Project mayhem is you have to trust Tyler"
  },
  "11": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "The second rule of project mayhem is you dont ask questions"
  },
  "12": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "The first rule of project mayhem is you dont ask questions"
  },
  "13": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "I want you to do me a favor. I want you to hit me as hard as you can"
  },
  "14": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "I dont wanna die without any scars"
  },
  "15": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "The things you used to own, now they own you."
  },
  "16": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "After youve been to fight club, watching football on television is watching pornography when you could be having great sex"
  },
  "17": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "You are not your job, you're not how much money you have in the bank. You are not the car you drive. You're not the contents of your wallet. You are not your fucking khakis. You are all singing, all dancing crap of the world."
  },
  "18": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"I know this because Tyler knows this.\""
  },
  "19": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "The lower you fall, the higher you'll fly."
  },
  "20": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"I found freedom. Losing all hope was freedom.\""
  },
  "21": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "May I never be complete. May I never be content. May I never be perfect."
  },
  "22": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "\"Slaves with white collars\""
  },
  "23": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "Maybe self-improvement isn't the answer, maybe self-destruction is the answer."
  },
  "24": {
    "Title": "Fight Club",
    "Author": "Chuck Palahniuk",
    "Quote": "It's only after we've lost everything that we're free to do anything."
  },
  "25": {
    "Title": "The Girl with the Dragon Tattoo",
    "Author": "Stieg Larsson",
    "Quote": "\"The killer tied her up and stuck her head into the smoldering embers of a fireplace. She was raped and murdered\""
  },
  "26": {
    "Title": "The Girl with the Dragon Tattoo",
    "Author": "Stieg Larsson",
    "Quote": "\"She was raped and strangled to death. The killer concluded his barbarities by shoving a parakeet up her vagina and then let all the animals out into the shop. Cats, turtles, white mice, rabbits, birds. Even the fish in the aquarium. So it was quite an appalling scene her sister encountered in the morning.\""
  },
  "27": {
    "Title": "The Girl with the Dragon Tattoo",
    "Author": "Stieg Larsson",
    "Quote": "\"On the porch lay the half-charred corpse of a cat. The cats legs and head had been cut off, then the body had been flayed and the guts and stomach removed, flung next to the corpse, which seemed to have been roasted over a fire. The cats head was intact, on the saddle of Salanders motorcycle.\""
  },
  "28": {
    "Title": "The Girl with the Dragon Tattoo",
    "Author": "Stieg Larsson",
    "Quote": "\"Ninety-two percent of women in Sweden who have been subjected to sexual assault have not reported the most recent violent incident to the police\"."
  },
  "29": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "Imagine his feelings when on his return to his inn he discovers that there is blood on his coat sleeve and a blood-stained knife in his pocket. All his vague forebodings leap into certainty.\nHe  he himself  is the killer! He remembers his headaches  his lapses of memory. He is quite sure of the truth  he, Alexander Bonaparte Cust, is a homicidal lunatic"
  },
  "30": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "But even a cornered beast will fight. Mr Cust fully believes that he did the murders but he sticks strongly to his plea of innocence. And he holds with desperation to that alibi for the second murder. At least that cannot be laid to his door."
  },
  "31": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "'She was quite wrong, of course. I realized that myself quite soon. I wasnt the sort of person to get on in life. I was always doing foolish things  making myself look ridiculous. And I was timid  afraid of people. I had a bad time at school  the boys found out my Christian names  they used to tease me about them . . . I did very badly at school  in games and work and everything.'      'Just as well poor mother died. Shed have been disappointed . . . Even when I was at the Commercial College I was stupid  it took me longer to learn typing and shorthand than anyone else. And yet I didnt feel stupid  if you know what I mean."
  },
  "32": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "But man was a ridiculous animal anyway . . .\nAnd he, Alexander Bonaparte Cust, was particularly ridiculous.\nHe had always been . . .\nPeople had always laughed at him . . .\nHe couldnt blame them . . ."
  },
  "33": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "In truth, it has been very like that. Each time I say: this is the end. But no, something else arises! And I will admit it, my friend, the retirement I care for it not at all. If the little grey cells are not exercised, they grow the rust."
  },
  "34": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "I speak the language of the tables. At roulette there may be a long run on the black  but in the end red must turn up. It is the mathematical laws of chance. You mean that luck turns?                                                                         Exactly, Hastings. And that is where the gambler (and the murderer, who is, after all, only a supreme kind of gambler since what he risks is not his money but his life) often lacks intelligent anticipation. Because he has won he thinks he will continue to win! He does not leave the tables in good time with his pocket full. So in crime the murderer who is successful cannot conceive the possibility of not being successful! He takes to himself all the credit for a successful performance  but I tell you, my friends, however carefully planned, no crime can be successful without luck!"
  },
  "35": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "To say a man does mad things because he is mad is merely unintelligent and stupid. A madman is as logical and reasoned in his actions as a sane man  given his peculiar biased point of view. For example, if a man insists on going out and squatting about in nothing but a loin cloth his conduct seems eccentric in the extreme. But once you know that the man himself is firmly convinced that he is Mahatma Gandhi, then his conduct becomes perfectly reasonable and logical."
  },
  "36": {
    "Title": "The ABC Murders",
    "Author": "Agatha Christie",
    "Quote": "A homicidal maniac who desires to kill usually desires to kill as many victims as possible. It is a recurring craving. The great idea of such a killer is to hide his tracks  not to advertise them."
  },
  "37": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "Race shouted: Where the devil did she get that pistol?\nPoirot felt a hand on his arm.                                                                             Mrs Allerton said softly, You  knew?\nHe nodded."
  },
  "38": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "Mrs Allerton said: You wanted her to take that way out?\nYes. But she would not take it alone. That is why Simon Doyle has died an easier death than he deserved."
  },
  "39": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "A man doesn't want to feel that a woman cares more for him than he cares for her. He doesn't want to feel owned, body and soul. It's that damned possessive attitude. This man is mine---he belongs to me! He wants to get away --- to get free. He wants to own his woman; he doesn't want her to own him.(Simon Boyle)"
  },
  "40": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "\"Do not open your heart to evil. Her lips fell apart; a look of bewilderment came into her eyes. Poirot went on gravely: Becauseif you doevil will comeYes, very surely evil will comeIt will enter in and make its home within you, and after a little while it will no longer be possible to drive it out."
  },
  "41": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "They conceive a certain theory, and everything has to fit into that theory. If one little fact will not fit it, they throw it aside. But it is always the facts that will not fit in that are significant."
  },
  "42": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "But then, how do you know?\"\n\"Because I am Hercule Poirot I do not need to be told."
  },
  "43": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "Take the Pyramids. Great blocks of useless masonry, put up to minister to the egoism of a despotic bloated king. Think of the sweated masses who toiled to build them and died doing it. It makes me sick to think of the suffering and torture they represent.\"\nMrs. Allerton said cheerfully: \"Youd rather have no Pyramids, no Parthenon, no beautiful tombs or templesjust the solid satisfaction of knowing that people got three meals a day and died in their beds.\"\nThe young man directed his scowl in her direction. \"I think human beings matter more than stones."
  },
  "44": {
    "Title": "Death on the Nile",
    "Author": "Agatha Christie",
    "Quote": "\"I like an audience, I must confess. I am vain, you see. I am puffed up with conceit. I like to say: See how clever is Hercule Poirot!\""
  },
  "45": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "So the only question we have to ask is whether magic is actually fading, and if thats the world we live in then thats what we want to believe. Litany of Gendlin: Whats true is already so, owning up to it doesnt make it worse. Got that, Draco? Im going to make you memorize it later. Its something you repeat to yourself any time you start wondering if its a good idea to believe something that isnt actually true."
  },
  "46": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "It's often more important to pay attention to the mindstate which said a thing than it is to pay attention to the thing itself."
  },
  "47": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "The same could be said of Dracos clever use of reciprocation pressure for an unsolicited gift, a technique which Harry had read about in his social psychology books (one experiment had shown that an unconditional gift of $5 was twice as effective as a conditional offer of $50 in getting people to fill out surveys). Draco had made an unsolicited gift of a confidence, and now invited Harry to offer a confidence in return..."
  },
  "48": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Now the way this game works, said the boy, is that you give me a triplet of three numbers, and Ill tell you Yes if the three numbers are an instance of the rule, and No if theyre not. I am Nature, the rule is one of my laws, and you are investigating me. You already know that 246 gets a Yes. When youve performed all the further experimental tests you wantasked me as many triplets as you feel necessaryyou stop and guess the rule, and then you can unfold the sheet of paper and see how you did. Do you understand the game?      ...................................................................................................................................................................................................                               Very well, said the boy, take the paper out and see how you did.\nHermione took the paper out of her pocket and unfolded it.\nThree real numbers in increasing order, lowest to highest.                                                        What youve just discovered is called positive bias, said the boy. You had a rule in your mind, and you kept on thinking of triplets that should make the rule say Yes. But you didnt try to test as many triplets as possible that should make the rule say No. In fact you didnt get a single No, so any three numbers could have just as easily been the rule. Its sort of like how people imagine experiments that could confirm their hypotheses instead of trying to imagine experiments that could falsify themthats not quite exactly the same mistake but its close. You have to learn to look on the negative side of things, stare into the darkness. When this experiment is performed, only 20% of grownups get the answer right. And many of the others invent fantastically complicated hypotheses and put great confidence in their wrong answers since theyve done so many experiments and everything came out like they expected."
  },
  "49": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Oh, well, what happened was that Fred and George and I saw this poor small boy at the train stationthe woman next to him had gone away for a bit, and he was looking really frightened, like he was sure he was about to be attacked by Death Eaters or something. Now, theres a saying that the fear is often worse than the thing itself, so it occurred to me that this was a lad who could actually benefit from seeing his worst nightmare come true and that it wasnt as bad as he feared\nHermione sat there with her mouth wide open.\nand after we were done giving him all the candy Id bought, we were like, Lets give him some money! Ha ha ha! Have some Knuts, boy! Have a silver Sickle! and dancing around him and laughing evilly and so on. I think there were some people in the crowd who wanted to interfere at first, but bystander apathy held them off at least until they saw what we were doing, and then I think they were all too confused to do anything. Finally he said in this tiny little whisper go away so the three of us all screamed and ran off, shrieking something about the light burning us. Hopefully he wont be as scared of being bullied in the future. Thats called desensitization therapy, by the way."
  },
  "50": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "What you did was mean!\nI think the word youre looking for is enjoyable, and in any case youre asking the wrong question. The question is, did it do more good than harm, or more harm than good? If you have any arguments to contribute to that question Im glad to hear them, but I wont entertain any other criticisms until that one is settled. I certainly agree that what I did looks all terrible and bullying and mean, since it involves a scared little boy and so on, but thats hardly the key issue now is it? Thats called consequentialism, by the way, it means that whether an act is right or wrong isnt determined by whether it looks bad, or mean, or anything like that, the only question is how it will turn out in the endwhat are the consequences."
  },
  "51": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Law of science, Draco. First I tell you the theory and the prediction. Then you show me the data. That way you know Im not just making up a theory to fit; you know that the theory actually predicted the data in advance. I have to explain this to you anyway, so I have to explain it before you show me the data. Thats the rule. So put on your cloak and lets sit down."
  },
  "52": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "After combining the trials, the results indicated that participants conformed to the incorrect group answer approximately one-third of the time."
  },
  "53": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "These results suggest that conformity can be influenced both by a need to fit in and a belief that other people are smarter or better informed."
  },
  "54": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "The Dark Lord came to that school openly, without disguise, glowing red eyes and all. The students tried to bar his way and he simply Apparated through. There was terror there, but discipline, and the Master came forth. And the Dark Lord demandednot asked, but demanded to be taught.\nProfessor Quirrells face was very hard. Perhaps the Master had read too many books telling the lie that a true martial artist could defeat even demons. For whatever reason, the Master refused. The Dark Lord asked why he could not be a student. The Master told him he had no patience, and that was when the Dark Lord ripped his tongue out.\nThere was a collective gasp.\nYou can guess what happened next. The students tried to rush the Dark Lord and fell over, stunned where they stood. And then\nThere is an Unforgiveable Curse, the Cruciatus Curse, which produces unbearable pain. If the Cruciatus is extended for longer than a few minutes it produces permanent insanity. One by one, the Dark Lord Crucioed the Masters students into insanity, and then finished them off with the Killing Curse, while the Master was forced to watch. When all his students had died in this way, the Master followed. I learned this from the single surviving student, whom the Dark Lord had left alive to tell the tale, and who had been a friend of mine                                          Dark Wizards cannot keep their tempers, Professor Quirrell saidquietly. It is a nearly universal flaw of the species, and anyone who makes a habit of fighting them soon learns to rely on it. Understand that the Dark Lord did not win that day. His goal was to learn martial arts, and yet he left without a single lesson. The Dark Lord was foolish to wish that story retold. It did not show his strength, but rather an exploitable weakness.                                                        Professor Quirrells gaze focused on a single child in the classroom.\nHarry Potter, Professor Quirrell said.\nYes, Harry said, his voice hoarse.\nWhat precisely did you do wrong today, Mr. Potter?\nHarry felt like he was going to throw up. I lost my temper.\nThat is not precise, said Professor Quirrell. I will describe it more exactly. There are many animals which have what are called dominance contests. They rush at each other with hornstrying to knock each other down, not gore each other. They fight with their pawswith claws\nsheathed. But why with their claws sheathed? Surely, if they used their claws, they would stand a better chance of winning? But then their enemy might unsheathe their claws as well, and instead of resolving the dominance contest with a winner and a loser, both of them might be\nseverely hurt.\nProfessor Quirrell gaze seemed to come straight out at Harry from the repeater screen. What you demonstrated today, Mr. Potter, is that unlike those animals who keep their claws sheathed and accept the resultsyou do not know how to lose a dominance contest. When a Hogwarts professor challenged you, you did not back down. When it looked like you might lose, you unsheathed your claws, heedless of the danger. You escalated, and then you escalated again. It started with a slap at you from Professor Snape, who was obviously dominant over you. Instead of losing, you slapped back and lost ten points from Ravenclaw. Soon you were talking about leaving Hogwarts. The fact that you escalated even further in some unknown direction, and somehow won at the end, does not change the fact that you are an idiot.                                                                                                                                     The next time, Mr. Potter, that you choose to escalate a contest rather than lose, you may lose all the stakes you place on the table. I cannot guess what they were today. I can guess that they were far, far too high for the loss of ten House points.                                                       I would have taken the slap, waited, and picked the best possible time to make my move, Harry said, his voice hoarse. But that would have meant losing. Letting him be dominant over me. It was what the Dark Lord couldnt do with the Master he wanted to learn from. Professor Quirrell nodded. I see that you have understood perfectly."
  },
  "55": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "There was a legendary episode in social psychology called the Robbers Cave experiment. It had been set up in the bewildered aftermath of World War II, with the intent of investigating the causes and remedies of conflicts between groups. The scientists had set up a summer camp for 22 boys from 22 different schools, selecting them to all be from stable middle-class families. The first phase of the experiment had been intended to investigate what it took to start a conflict between groups. The 22 boys had been divided into two groups of 11and this had been quite sufficient. The hostility had started from the moment the two groups had become aware of each others existences in the state park, insults being hurled on the first meeting. Theyd named themselves the Eagles and the Rattlers (they hadnt needed names for themselves when they thought they were the only ones in the park) and had proceeded to develop contrasting group stereotypes, the Rattlers thinking of themselves as roughand-tough and swearing heavily, the Eagles correspondingly deciding to think of themselves as upright-and-proper. The other part of the experiment had been testing how to resolve group conflicts. Bringing the boys together to watch fireworks hadnt worked at all. Theyd just shouted at each other and stayed apart. What had worked was warning them that there might be vandals in the park, and the two groups needing to work together to solve a failure of the parks water system. A common task, a common enemy.\nHarry had a strong suspicion Professor Quirrell had understood this principle very well indeed when he had chosen to create three armies per year.\nThree armies.\nNot four.\nAnd definitely not segregated by House except that no Slytherins had been assigned to Draco besides Mr. Crabbe and Mr. Goyle."
  },
  "56": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "The Prisoners Dilemma, according to Harrys teachings, ran thus: Two prisoners had been locked in separate cells. There was evidence against each prisoner, but only minor evidence, enough for a prison sentence of two years apiece. Each prisoner could opt to defect and betray the other; and this would take one year off their own prison sentence but add two years to the others. Or a prisoner could cooperate, staying silent. So if both prisoners defected, each testifying against the other, they would serve three years apiece; if both cooperated, or stayed silent, they would serve two years each; but if one defected and the other cooperated, the defector would serve a single year, and the cooperator would serve four. And both prisoners had to make their decision without knowing the other ones choice, and neither would be given a chance to change their decision afterward.\nDraco had observed that if the two prisoners had been Death Eaters during the Wizarding War, the Dark Lord would have killed any traitors. Harry had nodded and said that was one way to resolve the Prisoners Dilemmaand in fact both Death Eaters would want there to be a Dark\nLord for exactly that reason.\n(Draco had asked Harry to stop and let him to think about this for a while before they continued. It had explained a lot about why Father and his friends had agreed to serve under a Dark Lord who often wasnt nice to them)\nIn fact, Harry had said, this was pretty much the reason why people had governmentsyou might be better off if you stole from someone else, just like each prisoner would be individually better off if they defected in the Prisoners Dilemma. But if everyone thought like that, the country would fall into chaos and everyone would be worse off, like what would happen if both prisoners defected. So people let themselves be ruled by governments, just like the Death Eaters had let themselves be ruled by the Dark Lord.\nHarry had continued afterward, the fear of a third party punishing you was not the only possible reason to cooperate in the Prisoners Dilemma.\nSuppose, Harry had said, you were playing the game against a magically produced identical copy of yourself.\nHarry had nodded again, and said that this was yet another solution to the Prisoners Dilemmapeople might cooperate because they cared about each other, or because they had senses of honor, or because they wanted to preserve their reputation. Indeed, Harry had said, it was rather difficult to construct a true Prisoners Dilemmain real life, people usually cared about the other person, or their honor or their reputation or a Dark Lords punishment or something besides the prison sentences. But suppose the copy had been of someone completely selfish\n(Pansy Parkinson had been the example theyd used) so each Pansy only cared what happened to her and not to the other Pansy.\nGiven that this was all Pansy cared about and that there was no Dark Lord and Pansy wasnt worried about her reputation and Pansy either had no sense of honor or didnt consider herself obligated to the other prisoner then would the rational thing be for Pansy to cooperate, or defect?\nSome people, Harry said, claimed that the rational thing to do was for Pansy to defect against her copy, but Harry, plus someone named Douglas Hofstadter, thought these people were wrong. Because, Harry had said, if Pansy defectednot at random, but for what seemed to her like rational reasonsthen the other Pansy would think exactly the same way. Two identical copies wouldnt decide different things. So Pansy had to choose between a world in which both Pansies cooperated, or a world in which both Pansies defected, and she was better off if both copies cooperated. And if Harry had thought rational people did defect in the Prisoners Dilemma, then he wouldnt have done anything to spread that kind of rationality, because a country or a conspiracy full of rational people would dissolve into chaos. You would tell your enemies about rationality."
  },
  "57": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "You know, Draco, just as the fundamental question of rationality is What do I think I know and how do I think I know it?, theres also a cardinal sin, a way of thinking thats the opposite\nof that. Like the ancient Greek philosophers. They had no clue what was going on, so theyd go around saying things like All is water or All is fire, and they never asked themselves, Wait a minute, even if everything is water, how could I possibly know that? They didnt ask themselves if the had evidence which discriminated that possibility from all the other possibilities you could imagine, evidence theyd be very unlikely to encounter if the theory wasnt true"
  },
  "58": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Well, sounding wise wasnt difficult. It was a lot easier than being intelligent, actually, since you didnt have to say anything surprising or come up with any new insights. You just let your brains patternmatching software complete the cliche, using whatever Deep Wisdom youd stored previously."
  },
  "59": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "The old wizards face was peaceful. I am not perfect, Harry, but I think I have accepted my death as part of myself.                                                                                                            Uh huh, Harry said. See, theres this little thing called cognitive dissonance, or in plainer English, sour grapes. If people were hit on the heads with truncheons once a month, and no one could do anything about it, pretty soon thered be all sorts of philosophers, pretending to be wise as you put it, who found all sorts of amazing benefits to being hit on the head with a truncheon once a month. Like, it makes you tougher, or it makes you happier on the days when youre not getting hit with a truncheon. But if you went up to someone who wasnt getting hit, and you asked them if they wanted to start, in exchange for those amazing benefits, theyd say no.\nAnd if you didnt have to die, if you came from somewhere that no one had ever even heard of death, and I suggested to you that it would be an amazing wonderful great idea for people to get wrinkled and old and eventually cease to exist, why, youd have me hauled right off to a lunatic asylum! So why would anyone possibly think any thought so silly as that death is\na good thing? Because youre afraid of it, because you dont really want to die, and that thought hurts so much inside you that you have to rationalize it away, do something to numb the pain, so you wont have to think about it                                                                                                      No, Harry, the old wizard said. His face was gentle, his hand trailed through a lighted pool of water that made small musical chimes as his fingers stirred it. Though I can understand how you must think so.\nDo you want to understand the Dark Wizard? Harry said, his voice now hard and grim. Then look within the part of yourself that flees not from death but from the fear of death, that finds that fear so unbearable that it will embrace Death as a friend and cozen up to it, try to become one with the night so that it can think itself master of the abyss. You have taken the most terrible of all evils and called it good! With only a slight twist that same part of yourself would murder innocents, and call it friendship. If you can call death better than life then you can twist your moral compass to point anywhere"
  },
  "60": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "There comes a point in every plot where the victim starts to suspect; and looks back, and sees a trail of events all pointing in a single direction. And when that point comes, Father had explained, the prospect of the loss may seem so unbearable, and admitting themselves tricked may seem so humiliating, that the victim will yet deny the plot, and the game may continue long after."
  },
  "61": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Context: Harry discussing with Hermione whether plants are sentient or not.                       Look, its a question of multiplication, okay? Theres a lot of plants in the world, if theyre not sentient then theyre not important, but if plants are people then theyve got more moral weight than all the human beings in the world put together. Now, of course your brain doesnt realize that on an intuitive level, but thats because the brain cant multiply. Like if you ask three separate groups of Canadian households how much theyll pay to save two thousand, twenty thousand, or two hundred thousand birds from dying in oil ponds, the three groups will respectively state that theyre willing to pay seventy-eight, eighty-eight, and eighty dollars. No difference, in other words. Its called scope insensitivity. Your brain imagines a single bird struggling in an oil pond, and that image creates some amount of emotion that determines your willingness to pay. But no one can visualize even two thousand of anything, so the quantity just gets thrown straight out the window. Now try to correct that bias with respect to a hundred trillion sentient blades of grass, and youll realize that this could be thousands of times more important than we used to think the whole human species was.\""
  },
  "62": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "I'm not very good at feeling the size of large numbers. Once you start tossing around numbers larger than 1000 (or maybe even 100), the numbers just seem \"big\".\nConsider Sirius, the brightest star in the night sky. If you told me that Sirius is as big as a million earths, I would feel like that's a lot of Earths. If, instead, you told me that you could fit a billion Earths inside Sirius I would still just feel like that's a lot of Earths.\nThe feelings are almost identical. In context, my brain grudgingly admits that a billion is a lot larger than a million, and puts forth a token effort to feel like a billion-Earth-sized star is bigger than a million-Earth-sized star. But out of context  if I wasn't anchored at \"a million\" when I heard \"a billion\"  both these numbers just feel vaguely large."
  },
  "63": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "The more you try to justify yourself to people like that, the more it acknowledges that they have the right to question you. It shows you think they get to be your inquisitor, and once you grant someone that sort of power over you, they just push more and more. This was one of Draco Malfoys lessons which Harry had thought was actually pretty smart: people who tried to defend themselves got questioned over every little point and could never satisfy their interrogators; but if you made it clear from the start that you were a celebrity and above social conventions, peoples minds wouldnt bother tracking most violations. Thats why when Ron came over to me as I was sitting down at the Ravenclaw table, and told me to stay away from you, I held my hand out over the floor and said, You see how high Im holding my hand? Your intelligence has to be at least this high to talk to me."
  },
  "64": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "It could do a lot of harm if that secret got out! Havent you heard the saying, three can keep a secret if two are dead? That telling just your closest friends is the same as telling everyone, because youre not just trusting them, youre trusting everyone they trust."
  },
  "65": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "I have always wondered at how students bully each other, sighed the voice. How children make life difficult for themselves, how they turn their schools into prisons even with their own hands. Why do human beings make their own lives so unpleasant? I can give you a part of the\nanswer, Padma Patil. It is because people do not stop and think before causing pain, if they do not imagine that they themselves could also be hurt, that they might also suffer from their own misdeeds. But suffer you will, oh, yes, Padma Patil, suffer you will, if you stay on this road. You\nwill suffer the same pain of loneliness, the same pain of others fear and distrust, that you now inflict on Hermione Granger. Only for you it will be deserved."
  },
  "66": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Those metal doors were not the doors of individual cells, Professor Quirrell had said, each one opened into a corridor in which there would be a group of cells. Somehow that helped a little, not thinking that each door corresponded directly to a prisoner who was waiting right behind it. Instead there might be more than one prisoner, which diminished the emotional impact; just like the study showing that people contributed more when they were told that a given amount of money was required to save one childs life, than when told the same total amount was needed to save eight children"
  },
  "67": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "What do you think you know, and how do you think you know it?\nIf you did commit the perfect crime, nobody would ever find outso how could anyone possibly know that there werent perfect crimes? And as soon as you looked at it that way, you realized that perfect crimes probably got committed all the time, and the coroner marked it down as death by natural causes, or the newspaper reported that the shop had never been very profitable and had finally gone out of business "
  },
  "68": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "It is very simple, Mr. Potter, to understand how Azkaban was built, and how it continues to be. Men care for what they, themselves, expect to suffer or gain; and so long as they do not expect it to redound upon themselves, their cruelty and carelessness is without limit. All the other wizards of this country are no different within than he who sought to rule over them, You-Know-Who; they only lack his power and his frankness."
  },
  "69": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "On our first day of class, you tried to convince my classmates I was a killer.\nYou are. said professor Quirrell. But if your question is why I told them that, Mr. Potter, the answer is that you will find ambiguity a great ally on your road to power. Give a sign of Slytherin on one day, and contradict it with a sign of Gryffindor the next; and the Slytherins will be enabled to believe what they wish, while the Gryffindors argue themselves into supporting you as well. So long as there is uncertainty, people can believe whatever seems to be to their own advantage. And so long as you appear strong, so long as you appear to be winning, their instincts will tell them that their advantage lies with you. Walk always in the shadow, and light and darkness both will follow."
  },
  "70": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "If Harry hadnt been told that he couldnt leave Hogwarts, he probably wouldve jumped at the chance to spend more time in Hogwarts, he wouldve plotted and connived to get it. Hogwarts was literally optimal, not in all the realms of possibility maybe, but certainly on the real planet Earth, it was the Maximum Fun Location.\nHow could the castle and its grounds seem so much smaller, so much more confining, how could the rest of the world become so much more interesting and important, the instant Harry had been told that he wasnt allowed to leave? Hed spent months here and hadnt felt claustrophobic then.\nYou know the research on this, observed some part of himself, its just standard scarcity effects, like that time where as soon as a county outlawed phosphate detergents, people whod never cared before drove to the next county in order to buy huge loads of phosphate detergent, and surveys showed that they rated phosphate detergents as gentler and more effective and even easier-pouring and if you give two-year-olds a choice between a toy in the open and one protected by a barrier they can go around, theyll ignore the toy in the open and go for the one behind the barrier salespeople know that they can sell things just by telling the customer it might not be available it was all in Cialdinis book Influence, everything youre feeling right now, the grass is always greener on the side thats not allowed.\nIf Harry hadnt been told that he couldnt leave, he probably wouldve jumped at the chance to stay at Hogwarts over the summerbut not the rest of his life."
  },
  "71": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "You know, said the part of him that refined his skills, didnt you sort of ponder, once, how every different profession has a different way to be excellent, how an excellent teacher isnt like an excellent plumber; but they all have in common certain methods of not being stupid; and that one of the most important such techniques is to face up to your little mistakes before they turn into BIG mistakes? although this already seemed to qualify as a BIG mistake, actually\nThe point being, said his inner monitor, its getting worse literally by the minute. The way spies turn people is, they get them to commit a little sin, and then they use the little sin to blackmail them into a bigger sin, and then they use THAT sin to make them do even bigger things and then the blackmailer owns their soul.\nDidnt you once think about how the person being blackmailed, if they could foresee the whole path, would just decide to take the punch on the first step, take the hit of exposing that first sin? Didnt you decide that you would do that, if anyone ever tried to blackmail you into doing something major in order to conceal something little? Do you see the similarity here, Harry James Potter-Evans-Verres?"
  },
  "72": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Stanley Milgram had done the Milligram experiment to investigate the causes of World War\nII, to try to understand why the citizens of Germany had obeyed Hitler. So he had designed an experiment to investigate obedience, to see if Germans were, for some reason, more liable to obey harmful orders from authority figures.\nFirst hed run a pilot version of his experiment on American subjects, as a control. And afterward he hadnt bothered trying it in Germany. Experimental apparatus: A series of 30 switches set in a horizontal line, with labels starting at 15 volts and going up to 450 volts, with labels for each group of four switches. The first group of four labeled Slight Shock, the sixth group labeled Extreme Intensity Shock, the seventh group labeled Danger: Severe Shock, and the two last switches left over labeled just XXX.\nAnd an actor, a confederate of the experimenter, who had appeared to the true subjects to be someone just like them: someone who had answered the same ad for participants in an experiment on learning, and who had lost a (rigged) lottery and been strapped into a chair, along with the electrodes. The true experimental subjects had been given a slight shock from the electrodes, just so that they could see that it worked. The true subject had been told that the experiment was on the effects of punishment on learning and memory, and that part of the test was to see if it made a difference what sort of person administered the punishment; and that the person strapped to the chair would try to memorize sets of word pairs, and that each time the learner got one wrong, the teacher was to administer a successively stronger shock.\nAt the 300-volt level, the actor would stop trying to call out answers and begin kicking at the wall, after which the experimenter would instruct the subjects to treat non-answers as wrong answers and continue.\nAt the 315-volt level the pounding on the wall would be repeated. After that nothing would be heard. If the subject objected or refused to press a switch, the experimenter, maintaining an impassive demeanor and dressed in a gray lab coat, would say Please continue, then The experiment requires that you continue, then It is absolutely essential that you continue, then You have no other choice, you must go on. If the fourth prod still didnt work, the experiment halted there.\nBefore running the experiment, Milgram had described the experimental setup, and then asked fourteen psychology seniors what percentage of subjects they thought would go all the way up to the 450-volt level, what percentage of subjects would press the last of the two switches marked XXX, after the victim had stopped responding.\nThe most pessimistic answer had been 3%.\nThe actual number had been 26 out of 40.\nThe subjects had sweated, groaned, stuttered, laughed nervously, bitten their lips, dug their fingernails into their flesh. But at the experimenters prompting, they had, most of them, gone on administering what they believed to be painful, dangerous, possibly lethal electrical shocks. All the way to the end.                                                                                                               Harry could hear Professor Quirrell laughing, in his mind; the Defense Professors voice saying something along the lines of: Why, Mr. Potter, even I had not been so cynical; I knew men would betray their most cherished principles for money and power, but I did not realize that a stern look also sufficed.\nIt was dangerous, to try and guess at evolutionary psychology if you werent a professional evolutionary psychologist; but when Harry had read about the Milgram experiment, the thought had occurred to him that situations like this had probably arisen many times in the ancestral environment, and that most potential ancestors whod tried to disobey Authority were dead. Or that they had, at least, done less well for themselves than the obedient. People thought themselves good and moral, but when push came to shove, some switch flipped in their brain, and it was suddenly a lot harder to heroically defy Authority than they thought.\nEven if you could do it, it wouldnt be easy, it wouldnt be some effortless display of heroism. You would tremble, your voice would break, you would be afraid; would you be able to defy Authority even then?\nHarry blinked, then; because his brain had just made the connection between Milgrams experiment and what Hermione had done on her firs day of Defense class, shed refused to shoot a fellow student, even when Authority had told her that she must, she had trembled and been afraid but she had still refused. Harry had seen that happen right in front of his own eyes and he still hadnt made the connection until now                                                                                   Milgram had tried certain other variations on his test. In the eighteenth experiment, the experimental subject had only needed to call out the test words to the victim strapped into the chair, and record the answers, while someone else pressed the switches. It was the same apparent suffering, the same frantic pounding followed by silence; but it wasnt you pressing the switch. You just watched it happen and read the questions to the person being tortured.\n37 of 40 subjects had continued their participation in that experiment to the end, the 450-volt end marked XXX. And if you were Professor Quirrell, you might have decided to feel cynical\nabout that.\nBut 3 out of 40 subjects had refused to participate all the way to the end.\nThe Hermiones.\nThey did exist, in the world, the people who wouldnt fire a Simple Strike Hex at a fellow student even if the Defense Professor ordered them to do it. The ones who had sheltered Gypsies and Jews and homosexuals in their attics during the Holocaust, and sometimes lost their lives for it.\nAnd were those people from some other species than humanity? Did they have some extra gear in their heads, some additional chunk of neural circuitry, which lesser mortals did not possess? But that was not likely, given the logic of sexual reproduction which said that the genes for complex machinery would be scrambled beyond repair, if they were not universal.\nWhatever parts Hermione was made from, everyone had those same parts inside them somewherewell, that was a nice thought but it wasnt strictly true, there was such a thing as literal brain damage, people could lose genes and the complex machine could stop working, there were sociopaths and psychopaths, people who lacked the gear to care. Maybe Lord Voldemort had been born like that, or maybe he had known good and yet still chosen evil; at this point it didnt matter in the slightest. But a supermajority of the population ought to be capable of learning to do what Hermione and Holocaust resisters did.\nThe people who had been run through the Milgram experiment, who had trembled and sweated and nervously laughed as they went all the way to pressing the switches marked XXX, many of them had written to thank Milgram, afterward, for what they had learned about themselves."
  },
  "73": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Harry ate another bite of his cereal, his eyes going distant now, no longer meeting her own. Think of it this way: You skip school one day, and you lie and tell your teacher you were sick. The teacher tells you to bring a doctors note, so you forge one. The teacher says shes going to\ncall the doctor to check, so you have to give her a fake number for the doctor, and get a friend to pretend to be the doctor when she calls\nYou did what?\nHarry looked up from his cereal then, and now he was smiling. Im not saying I really did that, Hermione Then his eyes abruptly dropped back down to his cereal. No. Just an example. Lies propagate, thats what Im saying. Youve got to tell more lies to cover them up, lie about every fact thats connected to the first lie. And if you kept on lying, and you kept on trying to cover it up, sooner or later youd even have to start lying about the general laws of thought. Like, someone is selling you some kind of alternative medicine that doesnt work, and any double-blind experimental study will confirm that it doesnt work. So if someone wants to go on defending the lie, theyve got to get you to disbelieve in the experimental method. Like, the experimental method is just for merely scientific kinds of medicine, not amazing alternative medicine like theirs. Or a good and virtuous person should believe as strongly as they can, no matter what the evidence says. Or truth doesnt exist and theres no such thing as objective reality. A lot of common wisdom like that isnt just mistaken, its anti-epistemology, its systematically wrong. Every rule of rationality that tells you how to find the truth, theres someone out there who needs you to believe the opposite. If you once tell a lie, the truth is ever after your enemy; and theres a lot of people out there telling lies Harrys voice stopped."
  },
  "74": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Hessitation is always easy, rarely useful.\nSo the Defense Professor had told him; and while you could quibble about the details of the proverb, Harry understood the weaknesses of Ravenclaws well enough to know that you had to try answering your own quibbles. Did some plans call for waiting? Yes, many plans called for delayed action; but that was not the same as hesitating to choose. Not delaying because you knew the right moment to do what was necessary, but delaying because you couldnt make up your mindthere was no cunning plan which called for that.\nDid you sometimes need more information to choose? Yes, but that could also turn into an excuse for delaying; and it would be tempting to delay, when you were faced with a choice between two painful alternatives, and not choosing would avoid the mental pain for a time. So you would pick a piece of information you couldnt easily obtain, and claim that you couldnt possibly decide without it; that would be your excuse. Although if you knew what information you needed, knew when and how you would obtain that information, and knew what you would do depending on each possible observation, then that was less suspicious as an excuse for hesitating.\nIf you werent just hesitating, you ought to be able to choose in advance what you would do, once you had the extra information you claimed you needed."
  },
  "75": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "In a moral dilemma where you lost something either way, making the choice would feel bad either way, so you could temporarily save yourself a little mental pain by refusing to decide. At the cost of not being able to plan anything in advance, and at the cost of incurring a huge bias toward inaction or waiting until too late"
  },
  "76": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Fighting bullies might not be the best way to become a heroine. But Father had once told her that the trouble with passing up opportunities was that it was habit-forming. If you told yourself you were waiting for a better opportunity next time, why, next time youd probably tell yourself the same thing. Father had said that most people spent their whole lives waiting for an opportunity that was good enough, and then they died. Father had said that while seizing opportunities would mean that all sorts of things went wrong, it wasnt nearly as bad as being a hopeless lump. Father had said that after she got into the habit of seizing opportunities, then it was time to start being picky about them."
  },
  "77": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Ive read more references to Nicholas Flamel, Hermione said. The Rise and Fall of the Dark Arts says he secretly trained Dumbledore to stand up to Grindelwald. Theres a lot of books that take the story seriously, not just this one you think its too good to be true?\nNo, of course not, said Harry. Harry pulled out the chair next to her own, at the small table, and sat down beside her in his accustomed place on her right, just like hed never left; she had to choke back a catch in her throat. The idea of too good to be true isnt causal reasoning, the universe doesnt check if the output of the equations is too good or too bad before allowing it. People used to think that airplanes and smallpox vaccines were too good to be true."
  },
  "78": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "Problem one is that theres no logical reason why the same artifact would be able to transmute lead to gold and produce an elixir that kept someone young. I wonder if theres an official name for that in the literature? Like the turned up to eleven effect, maybe? If everyone can see a flower, you cant get away with saying flowers are the size of houses. But if youre in a flying saucer cult, since nobody can see the alien mothership anyway, you can say its the size of a city, or the size of the Moon. Observable things have to be constrained by evidence, but when somebody makes up a story, they can make the story as extreme as they want. So the Philosophers Stone gives you unlimited gold and eternal life, not because theres a single magical discovery that would produce both of those effects, but because someone made up a story about a super happy thingy."
  },
  "79": {
    "Title": "Harry Potter and the Methods of Rationality",
    "Author": "Eliezer Yudkowsky",
    "Quote": "I read once, Harry said, his voice a bit unsteady as he tried to match deep-sounding words to deep-sounding words, that its wrong to think of little children as innocent, because not knowing isnt the same as not choosing. That children do little harms to each other with schoolyard fights, because they dont have the power to do great harm. And some adults do great harm. But the adults who dont, arent they more innocent than children, not less?"
  },
  "80": {
    "Title": "The Master and Margarita",
    "Author": "Mikhail Bulgakov",
    "Quote": "I must counter him like this, Berlioz decided, yes, man is mortal, no\none disputes that. But the thing is...\nHowever, before he managed to utter these words, the foreigner spoke:\nYes, man is mortal, but that would be only half the trouble. The worst of it is that hes sometimes unexpectedly mortal - theres the trick! And generally hes unable to say what hes going to do this same evening.\nWhat an absurd way of putting the question ... Berlioz thought and objected: Well, theres some exaggeration here. About this same evening I do know more or less certainly. It goes without saying, if a brick should fall on my head on Bronnaya."
  },
  "81": {
    "Title": "Harry Potter and the Cursed Child",
    "Author": "J.K Rowling",
    "Quote": "I went far too light-heartedly into the subject of time travel in Harry Potter and the Prisoner of Azkaban. While I do not regret it (Prisoner of Azkaban is one of my favourite books in the series), it opened up a vast number of problems for me, because after all, if wizards could go back and undo problems, where were my future plots?I solved the problem to my own satisfaction in stages. Firstly, I had Dumbledore and Hermione emphasise how dangerous it would be to be seen in the past, to remind the reader that there might be unforeseen and dangerous consequences as well as solutions in time travel. Secondly, I had Hermione give back the only Time-Turner ever to enter Hogwarts. Thirdly, I smashed all remaining Time-Turners during the battle in the Department of Mysteries, removing the possibility of reliving even short periods in the future.This is just one example of the ways in which, when writing fantasy novels, one must be careful what one invents. For every benefit, there is usually a drawback."
  },
  "82": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\".......then take a girl and a dog  a collie, a chow, a sharpie, it doesn't really matter  and then hook up this transfusion pump, this IV set, and switch their blood, you know, pump the dog's blood into the hardbody and vice versa, did I ever tell you this?\""
  },
  "83": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\"I like the part in Body Double where the woman gets drilled by the power driller in the movie the best,\""
  },
  "84": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\"Do you know what a fucking loser you are?\" He starts nodding helplessly and I pull out a long, thin knife with a serrated edge and, being very careful not to kill him, push maybe half an inch of the blade into his right eye, flicking the handle up, instantly popping the retina."
  },
  "85": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "On my way into the Chinese cleaners I brush past a crying bum, an old man, forty or fifty, fat and grizzled, and just as I'm opening the door I notice, to top it off, that he's also blind and I step on his foot, which is actually a stump, causing him to drop his cup, scattering change all over the sidewalk. Did I do this on purpose? What do you think? Or did I do this accidentally?"
  },
  "86": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "Back at our table Reeves is telling Hamlin about how he taunts the homeless in the streets, about how he hands a dollar to them as he approaches and then yanks it away and pockets it right when he passes the bums."
  },
  "87": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "When I stopped on the corner of Sixteenth Street and made a closer inspection it turned out to be something called a \"Gay Pride Parade,\" which made my stomach turn. I stood in front of Paul Smith and watched with a certain traumatized fascination, my mind reeling with the concept that a human being, a man, could feel pride over sodomizing another man, but when I began to receive fey catcalls from aging, overmuscled beachboys with walrus like mustaches in between the lines \"There's a place for us, Somewhere a place for us,\" I sprinted over to Sixth Avenue, decided to be late for the office and took a cab back to my apartment where I put on a new suit (by Cerruti 1881), gave myself a pedicure and tortured to death a small dog I had bought earlier this week in a pet store on Lexington."
  },
  "88": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "In one swift movement I pick the dog up quickly by the neck and hold it with my left arm, pushing it back against the streetlamp while it nips at me and I can actually hear my hand crush its trachea. I push the serrated blade into its stomach and quickly slice open its hairless belly in a squirt of brown blood, its legs kicking and clawing at me, then blue and red intestines bulge out and I drop the dog onto the sidewalk, the queer just standing there, still gripping the leash, and this has all happened so fast he's in shock and he just stares in horror saying \"oh my god oh my god\" as the sharpei drags itself around in a circle, its tail wagging, squealing, and it starts licking and sniffing the pile of its own intestines. I push the queer back, hard, with a bloodied glove and start randomly stabbing him in the face and head, finally slashing his throat open in two brief chopping motions; an arc of red-brown blood splatters the white BMW 320i parked at the curb, setting off its car alarm, four fountainlike bursts coming from below his chin."
  },
  "89": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "Courtney is wearing a triple-layered silk organdy top and a long velvet skirt with a fishtail hem, velvet-ribbon and enamel earrings by Jos and Maria Barrera, gloves by Portolano and shoes from Gucci."
  },
  "90": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "Ignoring her, I reach into my pocket for a cigar, pull it out and tap it against the table. \"Patrick,\" she warns, staring at the flame. \"What?\" I ask, my hand frozen in midair, about to light the tip of the cigar. \"You didn't ask permission,\" she says, unsmiling. \"Did I tell you I'm wearing sixty-dollar boxer shorts?\" I ask, trying to appease her."
  },
  "91": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "I'm wearing a six-button double-breasted wool suit by Ermenegildo Zegna, a striped cotton shirt by Luciano Barbera, a silk tie by Armani, suede wing-tips by Ralph Lauren, socks by E. G. Smith. Men"
  },
  "92": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "I live in the American Gardens building on West 81st street. My name is Patrick Bateman. I'm 27 years old. I believe in taking care of myself, and a balanced diet and a rigorous exercise routine..."
  },
  "93": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "My name is Patrick Bateman. Im 27 years old. I believe in taking care of myself and a balanced diet and rigorous exercise routine. In the morning if my face is a little puffy Ill put on an ice pack while doing stomach crunches. I can do 1000 now. After I remove the ice pack I use a deep pore cleanser lotion. In the shower I use a water activated gel cleanser, then a honey almond body scrub, and on the face an exfoliating gel scrub. Then I apply an herb-mint facial mask which I leave on for 10 minutes while I prepare the rest of my routine. I always use an after shave lotion with little or no alcohol, because alcohol dries your face out and makes you look older. Then moisturizer, then an anti-aging eye balm followed by a final moisturizing protective lotion."
  },
  "94": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\"Don't be nasty. He's very handsome,\" she says and then suggests, \"Why don't you get your hair styled that way?\" Before this comment I was an automaton, only vaguely paying attention to Evelyn, but now I'm panicked, and I ask, \"What's wrong with my hair?\" In a matter of seconds my rage quadruples. \"What the hell is wrong with my hair?\" I touch it lightly."
  },
  "95": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\"You should match the socks with the trousers,\" Todd Hamlin tells Reeves, who is listening intently, stirring his Beefeater on the rocks with a swizzle stick. \"Who says?\" George asks. \"Now listen,\" Hamlin patiently explains. \"If you wear gray trousers, you wear gray socks. It's as simple as that.\" \"But wait,\" I interrupt. \"What if the shoes are black?\" \"That's okay,\" Hamlin says, sipping his martini. \"But then the belt has to match the shoes.\" \"So what you're saying is that with a gray suit you can either wear gray or black socks,\" I ask. \"Er yeah,\" Hamlin says, confused. \"I guess. Did I say that?\" \"See, Hamlin,\" I say, \"I disagree about the belt since the shoes are so far away from the actual belt line. I think you should concentrate on wearing a belt that coordinates with the trousers.\" \"He has a point,\" Reeves says."
  },
  "96": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "I wouldn't mind having sex with her body."
  },
  "97": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\"Don't wear that outfit again,\" I say, looking her over quickly. \"Thanks for the Ransom file.\" \"Um\" She stalls, about to hand me the Perrier, and asks, \"What? I didn't hear you,\" before setting the drink on my desk. \"I said,\" and I repeat myself calmly, grinning, \"do not wear that outfit again. Wear a dress. A skirt or something.\" She stands there only a little stunned, and after she looks down at herself, she smiles like some kind of cretin. \"You don't like this, I take it,\" she says humbly. \"Come on,\" I say, sipping my Perrier. \"You're prettier than that.\" 'Thanks, Patrick,\" she says sarcastically, though I bet tomorrow she'll be wearing a dress. The phone on her desk rings. I tell her I'm not here. She turns to leave. \"And high heels,\" I mention. \"I like high heels."
  },
  "98": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "\"What in the fuck is Morrison wearing?\" Preston asks himself. \"Is that really a glen-plaid suit with a checkered shirt?\" \"That's not Morrison,\" Price says. \"Who is it then?\" Preston asks, taking his glasses off again. \"That's Paul Owen,\" Price says. \"That's not Paul Owen,\" I say. \"Paul Owen's on the other side of the bar. Over there.\""
  },
  "99": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "The fingers I haven't nailed I try to bite off, almost succeeding on her left thumb which I manage to chew all the flesh off of, leaving the bone exposed."
  },
  "100": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "I finally have to resort to pouring acid around the outside of the pussy so that the flesh can give way to the greased end of the Habitrail and soon enough it slides in, easily. \"I hope this hurts you,\" I say."
  },
  "101": {
    "Title": "American Psycho",
    "Author": "Bret Easton Ellis",
    "Quote": "I start by skinning Torri a little, making incisions with a steak knife and ripping bits of flesh from her legs and stomach while she screams in vain, begging for mercy in a high thin voice, and I'm hoping that she realizes her punishment will end up being relatively light compared to what I've planned for the other one."
  },
  "102": {
    "Title": "**** ***** ** ****",
    "Author": "Gary Wilson",
    "Quote": "\"I count him braver who overcomes his desires than him who conquers his enemies; for the hardest victory is over self.\" Aristotle"
  },
  "103": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "\"all descriptions of artwork, architecture, documents and secret rituals in this novel are accurate\""
  },
  "104": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "\"It's a pentacle,\" Langdon offered, his voice feeling hollow in the huge space. \"One of the oldest symbols on earth. Used over four thousand years before Christ.\""
  },
  "105": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "As a young astronomy student, Langdon had been stunned to learn the planet Venus traced a perfect pentacle across the ecliptic sky every four years."
  },
  "106": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "If a pair of rabbits is placed in an enclosed area, how many rabbits will be born there if we assume that every month a pair of rabbits produces another pair and that rabbits begin to bear young two months after their birth?"
  },
  "107": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "\"PHI's ubiquity in nature,\" Langdon said, killing the lights, \"clearly exceeds coincidence, and so the ancients assumed the number PHI must have been preordained by the Creator of the universe. Early scientists heralded one-point-six-one-eight as the Divine Proportion.\""
  },
  "108": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "\"Measure the distance from your shoulder to your fingertips, and then divide it by the distance from your elbow to your fingertips.\""
  },
  "109": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "\"Hip to floor divided by knee to floor. PHI again.\""
  },
  "110": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "The Mona Lisa's status as the most famous piece of art in the world, Langdon knew, had nothing to do with her enigmatic smile. Nor was it due to the mysterious interpretations attributed her by many art historians and conspiracy buffs. Quite simply, the Mona Lisa was famous because Leonardo da Vinci claimed she was his finest accomplishment. He carried the painting with him whenever he traveled and, if asked why, would reply that he found it hard to part with his most sublime expression of female beauty."
  },
  "111": {
    "Title": "The Da Vinci Code",
    "Author": "Dan Brown",
    "Quote": "And Peter said, \"Did the Saviour really speak with a woman without our knowledge? Are we to turn about and all listen to her? Did he prefer her to us?\" And Levi answered, \"Peter, you have always been hot-tempered. Now I see you contending against the woman like an adversary. If the Saviour made her worthy, who are you indeed to reject her? Surely the Saviour knows her very well. That is why he loved her more than us.\" (The book claims this is Mary Magdelene's Gospel)"
  },
  "112": {
    "Title": "Cards on the Table",
    "Author": "Agatha Christie",
    "Quote": "\"It is difficult. I do not, you see, wish to ask you a leading question. If I say, did you notice so and so--well, I have put the thing into your head. Your answer will not be so valuable.\""
  },
  "113": {
    "Title": "Cards on the Table",
    "Author": "Agatha Christie",
    "Quote": "Hercule Poirot : The question is, can Hercule Poirot possibly be wrong?\nMrs. Lorrimer : No one can always be right.\nHercule Poirot : But I am! Always I am right. It is so invariable it startles me. And now it looks very much as though I may be wrong, and that upsets me. But I should not be upset, because I am right. I must be right because I am never wrong."
  },
  "114": {
    "Title": "Cards on the Table",
    "Author": "Agatha Christie",
    "Quote": "\"Nobody saw him?\" cried Rhoda.\n\"I saw,\" said Poirot. \"With the eyes of the mind one can see more than with\nthe eyes of the body. One leans back and closes the eyes--\"\nDespard said cheerfully:\n\"Let's stab him, Rhoda, and see if his ghost can come back and find out who\ndid it.\""
  },
  "115": {
    "Title": "Endless Night",
    "Author": "Agatha Christie",
    "Quote": "Every Night and every Morn                                                                                                   Some to Misery are born.                                                                                                             Every Morn and every Night                                                                                                              Some are born to Sweet Delight,                                                                                                       Some are born to Endless Night."
  },
  "116": {
    "Title": "The Book Thief",
    "Author": "Markus Zusak",
    "Quote": "A small fact: You are going to die.... does this worry you? Death"
  },
  "117": {
    "Title": "The Book Thief",
    "Author": "Markus Zusak",
    "Quote": "Forget the cold and the loneliness. He was a Jew, and if there was one place he was destined to exist, it was a basement or any other such hidden venue of survival."
  },
  "118": {
    "Title": "The Book Thief",
    "Author": "Markus Zusak",
    "Quote": "Its harder to find a Jew in the dark."
  },
  "119": {
    "Title": "The Book Thief",
    "Author": "Markus Zusak",
    "Quote": "Could you go up and tell me how the weather looks? Naturally, Liesel hurried up the stairs. She stood a few feet from the spit-stained door and turned on the spot, observing the sky. When she returned to the basement, she told him. The sky is blue today, Max, and there is a big long cloud, and its stretched out, like a rope. At the end of it, the sun is like a yellow hole. . . . Max, at that moment, knew that only a child could have given him a weather report like that."
  },
  "120": {
    "Title": "The Book Thief",
    "Author": "Markus Zusak",
    "Quote": "Youve got beautiful blond hair and big, safe blue eyes. You should be happy with that; is that clear?"
  },
  "121": {
    "Title": "The Book Thief",
    "Author": "Markus Zusak",
    "Quote": "They ARE Palestinians, they ARE Muslims, Christians and Jews, and they ARE you."
  }
}''';
