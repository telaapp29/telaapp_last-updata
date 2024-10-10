import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import 'package:telaproject/features/games_and_story/model/storymodel.dart';
import '../../core/Functions/functions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_btn.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 12, bottom: 30),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                  ),
                  onPressed: () {
                    customRemoveNavigate(context);
                  },
                ),
              ),
              Container(
                width: 568,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.white1,
                ),
                child: Text(
                  " choose your today’s topic",
                  style: CustomTextStyles.Interstyle25.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(
                  right: 23,
                  left: 29,
                  top: 40
                ),
                width: 529,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: AppColor.white2,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      storyContainer(context, "Farts in Space!", [
                        "When Adam accidentally farts in space,he sets off a BIG adventure!",
                        "Adam was an astronaut.\nHe liked astronomy and asteroids.\nHe liked atoms and angles.\nHe liked stars and quasars ",
                        "He also Likes beans.\nAnd what do we know about\n people who like beans?  ",
                        "Well,they like to fart a lot .",
                        "Adam was not about to let his love of\nbeans stop him from Exploring the\n mysteries and wonders of space.\n\nHe practiced every day so that he\ncould go to the moon.He wanted to wave at everyone in\nthe world-at all the people\neverywhere,from Africa to the\nAmericas,from Asia to Antarctica ",
                        "And one magic day,he was awarded the Amber Award for Astronaut\nExcellent.\nAdam was ready to go to the moon! ",
                        "He had a healthy breakfast of beans\nand got in this rocket. They fired up\nthe boosters.Adam put his seatbelt\non and counted down.\nThree-two-one-liftoff!",
                        "The rocket zoomed into the air.Soon\nit was high above the earth.\nAnd then he arrived at the moon!",
                        "It was nice on the moon.The Earth\nlooked very small.everyone in the\nworld was watching.\nAdam put his hand up to wave at\neveryone.\nHe was going to wave at everyone,\njust like he had dreamed every\nmoment since he was a baby\nAdam put his hand up to wave\nand...",
                        "Barb! Oops!Adam did a fart.\n A great,big beany bum boom.\nEveryone on Earth did not see Adam\nwaving at them.All they heard was a\ngreet big fart,like a small explosion on\nth moon.\nThe world Thought it was a meteorite.\n\"Ooh!\"they said.\nBut they didn't see what happened next.",
                        "Now is Space there is no air.And so it\nwas that this little fart had a lot of\nvelocity.It pushed Adam back,back,\nuntil he fell off the edge of the moon.\nAnd before Adam could grab onto his\nrocket, or onto anything at all,he was\nspinning into space on the pure force of his fart.",
                        "Adam spun past the planets...Mars,\n saturn,Jupiter...\nSoon he had passed the asteroid belt\nand was hurtling out of the solar system.",
                        "Adam saw the sun become a small star,\nand then a small dot,end then it was\ngone.",
                        "Adam was n't scared about his sudden\nbum thrusters.Space was very\ninteresting so far from home.\nHe saw new stars,and other planets,\nwhich he would have liked to explore,\nonly the force of his fart was driving\nhim ever further,deeper into the\ndepths of space.",
                        "They Adam started to notice a big\nblack shadow in the sky.As he got\ncloser he realized that there was no\nlight to be seen in it.It was a famous.\nBlack Hole.\nWhizz!Adam was sucked into the black Hole.",
                        "Inside it was like a washing machine.\nAdam did not realize it yet,but it\nwas a wormhole.It was tacking him\nback in time.A time that went all the\nway back to the origins of the\nuniverse.\nFrom one little fart,Adam was\nhaving quite the adventure!",
                        "Whoosh!He was thrown around and\nspat out somewhere in the vast\nspace time continuum.\nHe saw aliens flying spaceships.\n They shot at him with their laser beams.\nBut the gas content of Adam's fart\nmeant that greet big fire clouds\nemerged from his bottom and the\naliens got scared.\nThey screamed and zipped away.",
                        "Adam saw great big planets\ncovered in volcanoes,and teeny tiny\nplanets covered in swamps.One\ntime,he was captured in orbit\naround a planet,along with lots of\nrocks and ice.\n Adam was feeling cold until he felt\nanother rumble in his belly,and...\nBARP! his astral flatulence saved the\nday.He whooshed out of the orbit",
                        "Now Adam saw the universe was \ncontracting It was getting smaller\nand smaller. First it was the size of a\nplanet,then a small town,then a kitchen.\nSoon it was the size of a school bag,\nand then a postage stamp.Adam\nrealized there was not much more\nspace for him to explore.",
                        "Then there was an enormous BANG!\nA BIG BANG in fact!Adam had\nreached the beginning of the\nuniverse.",
                        "Adam's tummy felt funny,but his nose\nfelt worse.When all the noise and\nchaos had cleared,he looked\n around and saw...\nThe big bang was no big bang after all.\nIt was the original...",
                      ], [
                        "s11.jpg",
                        "s12.jpg",
                        "s13.jpg",
                        "s14.jpg",
                        "s15.jpg",
                        "s16.jpg",
                        "s1111.jpg",
                        "s17.jpg",
                        "s18.jpg",
                        "s19.jpg",
                        "s110.jpg",
                        "s111.jpg",
                        "s112.jpg",
                        "s113.jpg",
                        "s114.jpg",
                        "s115.jpg",
                        "s116.jpg",
                        "s117.jpg",
                        "s118.jpg",
                        "s119.jpg",
                        "s120.jpg",
                        "s121.jpg",
                        "s122.jpg",
                        "s123.jpg",
                      ]),
                      storyContainer(context, "Largo Doesn't Know", [
                        "Uh-oh! Large has Found some things he doesn't know! It must be time for a dargon adventure! ",
                        "Hello everybody!This is Largo.He is a large-bellied dragon with huge wings and big clompy paws who lives on a small island in Greece.He's the last dragon on the island,and people from all across the world come to see him at his rock in the middle of the town centre.They come to ask him questions,because everybody knows dragons know everything...\nor do they??",
                        "when Largo got home to his cave he stomped across it,huffing and puffing,confused.\nHow  could I not know that?!!!\"he said to him self.what else don't I know?How would anybody know that?\n Largo sat on his bed and thought to himself,what can I do ? He looked on his book shelf and said to himself,I could read all the books again ...Yes,that's what I will do!\nHours passed,and two hundred later largo dived back on his pillow and said,\"Done.Surely I can answer any questions now .So he went to bed feeling happy and ready for tomorrow.",
                        "The next morning when his alarm went off,he bounced out of bed,scratched his big belly and stretched his wings.\n",
                        "He could hear all the villagers kettles whistling and then their doors slamming,so he know it was time to go to  work.",
                        "\nHe flew down to the town to his usual rock.",
                        "As the day went on and the question kept coming,Largo was happy.He had been able to answer all the questions so far!But almost as soon as he thought it,a lady walked over to him and said,\"Hello Does pineapple belong on pizza?\nLargo said,quickly as anything,\" well it can go on pizza,it can go on anything,so the answer must be yes.\n",
                        "just then,a small girl walked past,saying\"Yuk!pineapple on pizza is gross!\"A man who was sitting on a bench said,\"I like pineapple on my pizza ...\"and the baker agreed with him,but then a fisherman said,No way!\n Largo thought to himself,the books said nothing about this!\"At that moment the town bell rang,and that meant it was time to go home,so he said his goodbyes and flew away.",
                        "When Largo got home, he was n't sad or angry or furious ,he was just confused.The books didn't mention anything about pineapple on pizza.\nWhen Largo was a younger dragon he remembered the older dragon say that they had been to many places,and that they had seen and heard many things,so maybe that's what he should do,thought Largo.\nSo then he thought to himself ,\"where should I go ?The world  is so big...what about England,spain or even Chine ? or maybe France,or what about Ukraine?I do like the sound of Turkey...\noh,there are so many places I could visit!\"",
                        "The next morning when his alarm went off,he scratched his big belly,stretched his hug wings,and picked up his backpack.he flew down towards the town,waving at every body,saying,\"I'm just going on a little trip!I will be back  soon!\"\nPeople waved back and off he flew,past all his friends :the fisherman,the seamstress,the mayor and the baker,in the direction of England.",
                        "As Largo flew over the ocean,he saw a humongous cruise liner with lots of people on the deck,playing games and laying in the sun.Largo remembered when he read a book about how engines work,and he was so surprised. ",
                        "A little further into his journey ,he saw an albatross .\nHe remembered then when the baker asked hom how big was the wingspan of an albatross.\nLargo remembered from a book he reed that it was about six foot four inches...that's nearly as long as him!",
                        "In the distance,Largo could see what looked like England.\n\"WOW!\" Largo thought to himself as he flew toward london.The building are so tall and shiny!\"\nHe landed at a very big posh house that had a missive lack in front of it.on that lake there where lots of swans,and on a bench an elderly lady was sitting down admiring theme.",
                        "Largo flew down to the lady and said ,\"Hello!I'm looking for answers to questions that people might ask me ...can you help with an interesting fact?\"\nThe Elderly lady smiled and said,\"when I was a little girl,a really tall dragon asked me a similar question\".she tipped her head to the swans and said ,\"Did you know that in England all the swans belong to the king?\"\nLargo smiled and said,\"Thank you\"and he spread his wings and flew away.",
                        "As hHe flew across the ocean on his way to Spine ,Largo he thought ,fancy that one men swans!\"\nspine was n't that far a way from England ,and as Largo crossed the ocean he spotted seals laying on a rock.He had spoken with with one before and learned that males see loins are called bulls and females are called cows.It was weired and interesting all at once ,he thought. ",
                        "As he got closer Spin,he could see a lighthouse.He figured that it would by as a good of a place as anywhere to land.\nAs he set down hr saw a small girl.She said ,\"You're a dragon!\"\nYup!\" he smiled back at her.\nshe said,\"Did you now that this is called Torre do Hercules ?it's the oldest lighthouses in spain.\"\n\"How interesting\",Largo said to himself,and then he thought \"where to next?\"",
                        "France sounds like a good idea ,\"thought Largo .\"There altos of interesting things in france,like the Louvre,the most famous art museum in the world,and croissants ...who doesn't love one of those?\"\nLargo flew and flew.As he approached France he could see a big pointy tower.\"It must be the Eiffel tower,\"He thought ,and that seemed like a good place to land.\nAs Largo landed,he saw a lady thought her window.when she spotted Largo ,she smiled and waved.\nspotted Largo,she smiled and waved.\n\"Bonjour!\"the lady said.\n\"Hello!\"said Largo\nAs he plodded towards her,he noticed that in front of her was a machine\n\"What's that there?\"Largo said.\n\"It's sewing machine. you make clothes with it .It was invented in France ,did you know ?\"\nLargo smiled and said \"Thank you\"and he said also said goodbye then plodded up the road. ",
                        "As Largo sat down,his belly growled a huge grumble.but just then,that same lady who told him about the sewing machine walked up to him and said,\n\"I heard your belly grumble from all the way down the rood,so I brought you some quiche...\"\nLargo smiled ,He had never had quiche before\nAt that,she said to him,\"It is a dish invented by the French.\nOnce Largo had finished eating,he stretched his big wings and wiggled his hips in a big circle and flew up into the air.\n\"where to now?\"Largo thought to himself.\"The Ukraine!That sounds like a amazing idea.\" ",
                        "As Largo flew across the vast ocean , he could see a storm in the distance with dark gray clouds and lighting. He could hear thunder too. And then he remembered reading that to work out how far away a storm is ,you count the seconds between the lightning and the thunder , then if you have to count five , the storm is one mile away…\nAs Largoflew over all the different countries and came to the Ukraine , he started to glide down.But as he did,he zigzagged throught the forest and his huge wing crashed into a tree.He went tumbling down to the ground with a huge wing crashed into a tree.He went tumblig down to the ground with a huge thud.\”OUCH!he roaded",
                        "Luckily for Largo there was a man driving his truck past who saw him crashed .he rushed over to check on him.As the man reached the friendly looking dragon he called out,\”Are you okay ,my friend?\”\nLargo held his wing and said,\” Come with me! I will take you to the hospital.\”\nAs they approached the hospital, the man said to Largo,\”They can give you an x-ray on your wing. Did you know the x-ray \”Wow!\” said Largo.\”That’s so interesting!\” As the man reached the friendly looking dragon he called out,\”Are you okay ,my friend?\”\nLargo held his wing and said,\” Come with me! I will take you to the hospital.\”\nAs they approached the hospital, the man said to Largo,\”They can give you an x-ray on your wing. Did you know the x-ray \”Wow!\” said Largo.\”That’s so interesting!\” ",
                        "As the huge cruiseliner approach his little island,he waved goodbye to all the passengers and the captain,and waddled all the way down the pier.He was greeted by a hug sign saying:\nWelcome Home Largo!\n\nin brightly -coloured hand-painted letters.\nEverybody was there:the mayor ,the baker,the seamstress and the fisherman ...even a few children who seemed so excited to see him too.\nThe mayor said,\"The fisherman said he had heard on the radio that the cruise liner was bringing a dragon home.A dragon who had a big belly ,huge wings and greet big clompy feet ,who was asking lots of question.We knew that had to be you!\"\nAnd the dragon lived happily back on his island,with many more answers to share.",
                      ], [
                        "s21.jpg",
                        "s22.jpg",
                        "s22.jpg",
                        "s23.jpg",
                        "s24.jpg",
                        "s25.jpg",
                        "s26.jpg",
                        "s27.jpg",
                        "s28.jpg",
                        "s29.jpg",
                        "s210.jpg",
                        "s211.jpg",
                        "s212.jpg",
                        "s213.jpg",
                        "s214.jpg",
                        "s215.jpg",
                        "s216.jpg",
                        "s217.jpg",
                        "s218.jpg",
                        "s219.jpg",
                        "s220.jpg",
                        "s212.jpg",
                        "s219.jpg",
                        "s210.jpg",
                        "s216.jpg",
                      ]),
                      storyContainer(context, "Elvis' Big Adventure", [
                        "Elvis the Worm decides to go on an adventure to find some friends",
                        "Hello friends! My name is Harry.\nI'm an owl. I sit up high in the trees\nwhere nobody can see me,but I\ncan see everything.\nFirstly, let me say how lovely it is\nfor you to stop by to hear a story. I\nwant to share with you a story \nabout a friend of mine",
                        "It was a chilly morning over in the field, when I spotted a worm named Elvis. He was an ordinary worm who did ordinary things most days.\nThis day, he seemed to be moving around, not like he usually did.\nHe seemed to be lost",
                        "Well, what was actually the case was that he was looking for somebody to talk to. He couldn't see any other worms or beetles or ladybugs - not even a cat! - so an idea came to him. He thought he should go to the other field and find someone there.\nHe seemed pretty sure he would find somebody to talk to in the other field, so that's what he did.",
                        "Elvis was just a worm, so he wasn't too fast, but for a worm he also wasn't too slow. So as he wiggled across the field in the direction of the road...\nAs he crossed the field, the morning frost had lifted and it was warming up. As he slithered past a bush, he decided to have a little rest, when a voice said with a muffled voice,\n\"Where are you going, Elvis?\"",
                        "Elvis said, \"I'm going to find some friends to talk to.\"\n The chomping caterpillar who had spoken to him said,\"That's nice. I hope you find them. Be safe out there.\"\n Elvis smiled at the caterpillar, then slithered away in the direction of the road.",
                        "The sky started going gray and the wind got stronger. Elvis decided it was time to hide by a tree.There were loads of leaves on the floor; perfect for a worm who wants to hide. He snuggled down in the leaves.\nA voice said, \"Excuse me!\" in a firm voice. Elvis looked around. He couldn't seeany body",
                        "For a second time, the same voice said, \"Excuse me, please!\" And then Elvis spotted some eyes under him.\nHe had accidentally snuggled on top of a butterfly, who was doing the samething as him!\"\nOops! I'm so sorry!\" said Elvis.",
                        "Louise the Butterfly wasn't cross. She just said, \"It's okay, my lovely.\" Elvis said, \"I'm on the way to find to some friends to talk to. Louise the Butterfly gave a little grin and said,\"That's nice!\"And they had a little chat.",
                        "Some time later, the sky cleared up and Elvis decided it was time to go, so off he slid. He slid and slid pretty fast - for a worm, anyway - until a ball appeared in front of him.\nHe went to the left. The ball rolled left.\nHe went to the right The ball rolled right.",
                        "Elvis felt bright eyed and bushy tailed - well,if he had had a tail, he would have.\nHe crossed the road, which was black and full of holes from all the trucks rumbling down it.",
                       "\nAs he got to the other side, out jumped a hedgehog.\n\"FREEZE!\" said the hedgehog in a calm voice.\nIts a good thing Elvis listened to the hedgehog, as the path in front of Elvis wasn't there! It was a giant hole filled with water and oil, which was shiny and green like grass.\nElvis looked down.\n\"Thanks so much,\" he said.",
                        "\"Glynn the Hedgehog,\" said the hedgehog. \"Where are you going?\"\nElvis said, \"im going to find some friends\nThen Glynn smiled and said, \"WE could be friends if you want.\"",
                        "Before Elvis could respond, a massive dog suddenly appeared. He looked at them both.\nBoth hedgehog and earthworm froze.\nThen the huge dog said, \"Hello! How are you? Do you want to be friends?\"",
                        "He had a soft and friendly voice, and the two friends realised he meant them no harm at all.\n\"Yeah,\" they both said. \"That sounds great. You can come with us to the field, if you like?\"",
                        "So now there was Elvis the Worm, Glynn the Hedgehog and the dog, who they learned was called Ben, all heading to the field.",
                        "A tiny robin landed on the gate of the fence and said, \"Hello sweeties.!\nWhere are you going?\"in the gentlest,sweetest voice you would ever hear.\nElvis wiggled forward and said, \"We're going to find some friends to talk to.\"\n\"That's so lovely,\" said Rosemary the Robin. \"Can I come with you all?\"\nThey all nodded.",
                        "Finally Elvis realised they'd arrived.\n\"We are here!\" he shouted excitedly.",
                        "Ben the Dog jumped for excitement, Glynn the Hedgehog hopped with joy, and Rosemary the Robin bounced on the spot. But Elvis was looking at them, surprised.\n\"Now what?\" Glynn the Hedgehog said to Elvis.",
                        "Elvis looked puzzled for a moment as he gazed at all his new friends.\n",
                        "Then he smiled as he realised he had already made friends... allthese friends, along the way!",
                      ], [
                        "s31.jpg",
                        "s32.jpg",
                        "s33.jpg",
                        "s34.jpg",
                        "s35.jpg",
                        "s36.jpg",
                        "s37.jpg",
                        "s38.jpg",
                        "s39.jpg",
                        "s310.jpg",
                        "s311.jpg",
                        "s312.jpg",
                        "s314.jpg",
                        "s315.jpg",
                        "s316.jpg",
                        "s317.jpg",
                        "s318.jpg",
                        "s319.jpg",
                        "s320.jpg",
                        "s321.jpg",
                        "s311.jpg",
                        "s312.jpg",
                        "s314.jpg",
                        "s315.jpg",
                      ]),
                      //storyContainer(context,"The ForgetFul Elephant","Peter the Elephant just can't remember a thing! What will he do when he forgets why he's made himself a reminder?!","s10.jpg","s11.jpg","s12.jpg"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, left: 80),
                child: CustomBtn(
                  text: "ee",
                  width: 250,
                  height: 60,
                  onPressed: () {
                    customRemoveNavigate(context);
                  },
                ).customButton(const Icon(
                  Icons.home_outlined,
                  size: 50,
                  color: AppColor.black,
                )),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget storyContainer(BuildContext context, String nameOfStory,
          List storyText, List imageStory) =>
      GestureDetector(
        onTap: () {
          GoRouter.of(context).push("/Story",
              extra: StoryModel(nameOfStory, storyText, imageStory));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 160,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: AppColor.white,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/image6.png",
                      )),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      width: 120,
                      child: Text(
                        nameOfStory,
                        style: CustomTextStyles.Merriweatherstyle40,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColor.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
