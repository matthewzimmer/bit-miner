## Bit Miner

Bit Miner is a social hub for Bitcoin miners to collectively collaborate and track their Bitcoin mining efforts. It is
powered by a Rails 4 service layer and is hosted on Heroku at the following endpoint:

  https://bit-miner.herokuapp.com


## What is a Miner?

Miners are individuals who run computer systems to repeatedly calculate hashes with the intention to create a
successful block and earn coins from transaction fees and new coins created with the block itself. The term references
an analogy of gold miners who dig gold out of the ground and thus 'discover' new gold that can be used to create new
coins, with a similar kind of discovery occurring with a successful hash to create new Bitcoins.


## Service Architecture

**Note:** Click on each image to view it at full scale.

<img src="https://bit-miner.herokuapp.com/images/soa.jpg" alt="Service Architecture" width="800" style="width:800px;"/>

<img src="https://bit-miner.herokuapp.com/images/uml.png" alt="Model Architecture" width="800" style="width:800px;"/>


## Client Interfaces

There are two client interfaces found inside of this project. The [primary client interface](https://bit-miner.herokuapp.com/miners "Primary Client Interface") allows you to view,
create, update and delete Miner profiles. A secondary client is also baked inside of the [wrappers/ios/bitminer](https://github.com/matthewzimmer/bit-miner/tree/master/wrappers/ios/bitminer "iOS App") directory. It is
an iOS application allowing you to view Miners' avatar, nickname and mining statistics.

If you would like to run the app on an iPhone, please submit a request to [join my "BitMiner" TestFlight team](http://tflig.ht/1jcM5Bi) and I will
add your device. Alternatively, download the [BitMiner_1_0_0.ipa](https://github.com/matthewzimmer/bit-miner/raw/master/wrappers/ios/builds/BitMiner_1_0_0.ipa "BitMiner_1_0_0.ipa") build in the [wrappers/ios/builds](https://github.com/matthewzimmer/bit-miner/tree/master/wrappers/ios/builds) directory and [resign the archive with your
provisioning profile](https://gist.github.com/renexu/5597853).