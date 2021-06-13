//
//  TrendingMedia.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/08.
//

import Foundation

struct TrendingMovie: Decodable {
   private var title: String?
   private var originalTitle: String?
   
//   private var name: String?
//   private var originalName: String?
//
   var id: Int
   var mediaType: String
   
//   var itemTitle: String { title ?? name ?? "No name or title." }
//   var originalItemTitle: String { originalTitle ?? originalName ?? "No original name or title." }
//   
   var overview: String
   var originalLanguage: String
   var originCountry: [String]
   
   var genreIds: [Genre]
   var releaseDate: String
   var video: Bool?
   var adult: Bool

   var popularity: Float
   var voteCount: Int
   var voteAverage: Float

   var posterPath: String?
   var backdropPath: String?
}

//{
//   "page":1,
//   "results":[
//      {
//         "poster_path":"/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg",
//         "original_name":"Loki",
//         "origin_country":[
//            "US"
//         ],
//         "vote_average":8.2,
//         "id":84958,
//         "overview":"After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant”or help fix the timeline and stop a greater threat.",
//         "first_air_date":"2021-06-09",
//         "backdrop_path":"/Afp8OhiO0Ajb3NPoCBvfu2pqaeO.jpg",
//         "vote_count":1564,
//         "genre_ids":[
//            10759,
//            10765
//         ],
//         "name":"Loki",
//         "original_language":"en",
//         "popularity":1926.329,
//         "media_type":"tv"
//      },
//      {
//         "backdrop_path":"/xpba0Dxz3sxV3QgYLR8UIe1LAAX.jpg",
//         "genre_ids":[
//            18,
//            10765
//         ],
//         "original_language":"en",
//         "id":103768,
//         "original_name":"Sweet Tooth",
//         "origin_country":[
//            "US"
//         ],
//         "vote_average":8.1,
//         "name":"Sweet Tooth",
//         "overview":"On a perilous adventure across a post-apocalyptic world, a lovable boy who's half-human and half-deer searches for a new beginning with a gruff protector.",
//         "vote_count":199,
//         "poster_path":"/rgMfhcrVZjuy5b7Pn0KzCRCEnMX.jpg",
//         "first_air_date":"2021-06-04",
//         "popularity":659.961,
//         "media_type":"tv"
//      },
//      {
//         "name":"Lupin",
//         "backdrop_path":"/dVHeJXUzHJJGadB2wvpuAn6fsdN.jpg",
//         "id":96677,
//         "genre_ids":[
//            80,
//            18,
//            9648
//         ],
//         "vote_count":837,
//         "original_language":"fr",
//         "original_name":"Lupin",
//         "origin_country":[
//            "FR"
//         ],
//         "overview":"Inspired by the adventures of Arsène Lupin, gentleman thief Assane Diop sets out to avenge his father for an injustice inflicted by a wealthy family.",
//         "poster_path":"/sgxawbFB5Vi5OkPWQLNfl3dvkNJ.jpg",
//         "vote_average":7.9,
//         "first_air_date":"2021-01-08",
//         "popularity":375.627,
//         "media_type":"tv"
//      },
//      {
//         "poster_path":"/4EYPN5mVIhKLfxGruy7Dy41dTVn.jpg",
//         "vote_average":8.5,
//         "first_air_date":"2016-01-25",
//         "vote_count":9175,
//         "overview":"Bored and unhappy as the Lord of Hell, Lucifer Morningstar abandoned his throne and retired to Los Angeles, where he has teamed up with LAPD detective Chloe Decker to take down criminals. But the longer he's away from the underworld, the greater the threat that the worst of humanity could escape.",
//         "id":63174,
//         "genre_ids":[
//            80,
//            10765
//         ],
//         "backdrop_path":"/h48Dpb7ljv8WQvVdyFWVLz64h4G.jpg",
//         "name":"Lucifer",
//         "original_name":"Lucifer",
//         "origin_country":[
//            "US"
//         ],
//         "original_language":"en",
//         "popularity":1391.815,
//         "media_type":"tv"
//      },
//      {
//         "name":"Mare of Easttown",
//         "genre_ids":[
//            80,
//            18,
//            9648
//         ],
//         "original_language":"en",
//         "poster_path":"/78aK4Msbr22A5PGa6PZV0pAvdwf.jpg",
//         "id":115004,
//         "vote_average":8.1,
//         "original_name":"Mare of Easttown",
//         "origin_country":[
//            "US"
//         ],
//         "vote_count":243,
//         "overview":"A detective in a small Pennsylvania town investigates a local murder while trying to keep her life from falling apart.",
//         "backdrop_path":"/7X1IGIl1JMJ9YFzJymCVoqZbvTR.jpg",
//         "first_air_date":"2021-04-18",
//         "popularity":556.24,
//         "media_type":"tv"
//      },
//      {
//         "poster_path":"/WjQmEWFrOf98nT5aEfUfVYz9N2.jpg",
//         "original_name":"The Bad Batch",
//         "origin_country":[
//            "US"
//         ],
//         "vote_average":8.7,
//         "id":105971,
//         "overview":"The 'Bad Batch' of elite and experimental clones make their way through an ever-changing galaxy in the immediate aftermath of the Clone Wars.",
//         "first_air_date":"2021-05-04",
//         "backdrop_path":"/sjxtIUCWR74yPPcZFfTsToepfWm.jpg",
//         "vote_count":275,
//         "genre_ids":[
//            10765,
//            10759,
//            16
//         ],
//         "name":"The Bad Batch",
//         "original_language":"en",
//         "popularity":540.216,
//         "media_type":"tv"
//      },
//      {
//         "name":"Lisey's Story",
//         "first_air_date":"2021-06-04",
//         "id":95839,
//         "backdrop_path":"/63zbegJkwsiAg4DLM0AeP4bkKkn.jpg",
//         "vote_count":6,
//         "genre_ids":[
//            9648,
//            18
//         ],
//         "vote_average":9.3,
//         "original_language":"en",
//         "poster_path":"/ge0Lk0fDBoFNGdtBXnIEaonyfTW.jpg",
//         "original_name":"Lisey's Story",
//         "origin_country":[
//            "US"
//         ],
//         "overview":"This terrifying thriller follows widow Lisey Landon as a series of disturbing events revives memories of her marriage to author Scott Landon and the darkness that plagued him.",
//         "popularity":48.894,
//         "media_type":"tv"
//      },
//      {
//         "first_air_date":"1994-09-22",
//         "backdrop_path":"/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg",
//         "genre_ids":[
//            35,
//            18
//         ],
//         "original_language":"en",
//         "poster_path":"/f496cm9enuEsZkSPzCwnTESEK5s.jpg",
//         "vote_count":4642,
//         "vote_average":8.4,
//         "id":1668,
//         "original_name":"Friends",
//         "origin_country":[
//            "US"
//         ],
//         "overview":"The misadventures of a group of friends as they navigate the pitfalls of work, life and love in Manhattan.",
//         "name":"Friends",
//         "popularity":237.434,
//         "media_type":"tv"
//      },
//      {
//         "poster_path":"/tl1Gyi1Ee9HCRD7IieZScoJL9I4.jpg",
//         "original_name":"Dom",
//         "origin_country":[
//            "BR"
//         ],
//         "name":"DOM",
//         "first_air_date":"2021-06-04",
//         "vote_count":21,
//         "vote_average":8.0,
//         "backdrop_path":"/89oMRMX6QVRjwgyJoekbORF0jxO.jpg",
//         "overview":"A father who never stopped fighting against drugs. A son who never stopped using them. Two sides of the same coin. Victor is a cop who has fought all his life to curb cocaine trafficking. His son is a drug addict who has become one of the most wanted burglars in Rio de Janeiro. Will a father’s love be enough to save his son’s life?",
//         "genre_ids":[
//            80,
//            18
//         ],
//         "id":123377,
//         "original_language":"pt",
//         "popularity":47.319,
//         "media_type":"tv"
//      },
//      {
//         "name":"Game of Thrones",
//         "genre_ids":[
//            10765,
//            18,
//            10759
//         ],
//         "original_language":"en",
//         "poster_path":"/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
//         "original_name":"Game of Thrones",
//         "origin_country":[
//            "US"
//         ],
//         "id":1399,
//         "vote_count":14690,
//         "vote_average":8.4,
//         "overview":"Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
//         "first_air_date":"2011-04-17",
//         "backdrop_path":"/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
//         "popularity":495.694,
//         "media_type":"tv"
//      },
//      {
//         "original_name":"Ragnarok",
//         "original_language":"no",
//         "id":91557,
//         "overview":"A small Norwegian town experiencing warm winters and violent downpours seems to be headed for another Ragnarök -- unless someone intervenes in time.",
//         "vote_average":8.0,
//         "name":"Ragnarok",
//         "first_air_date":"2020-01-31",
//         "backdrop_path":"/wu444tM9YBllq9UcBv5TeidO3j3.jpg",
//         "vote_count":464,
//         "genre_ids":[
//            18,
//            10765,
//            9648
//         ],
//         "poster_path":"/xUtOM1QO4r8w8yeE00QvBdq58N5.jpg",
//         "origin_country":[
//            "NO"
//         ],
//         "popularity":999.107,
//         "media_type":"tv"
//      },
//      {
//         "origin_country":[
//            "US"
//         ],
//         "vote_average":7.5,
//         "overview":"In the forgotten town of Carp, Texas, Panic is the only way out. Every summer the graduating seniors risk their lives competing in a series of challenges for the chance to win life-changing money. After the death of two players the stakes—and danger—have never been higher.",
//         "id":122530,
//         "name":"Panic",
//         "backdrop_path":"/n9JoMVu8exHVQFzKvpeysyhIN4H.jpg",
//         "vote_count":60,
//         "genre_ids":[
//            10759,
//            18,
//            80
//         ],
//         "poster_path":"/yNsVFQsXW5CYtFkrDSu5BmLEtdF.jpg",
//         "original_language":"en",
//         "first_air_date":"2021-05-27",
//         "original_name":"Panic",
//         "popularity":28.654,
//         "media_type":"tv"
//      },
//      {
//         "backdrop_path":"/b0WmHGc8LHTdGCVzxRb3IBMur57.jpg",
//         "id":88396,
//         "vote_count":5836,
//         "original_language":"en",
//         "first_air_date":"2021-03-19",
//         "origin_country":[
//            "US"
//         ],
//         "genre_ids":[
//            10765,
//            10759,
//            18,
//            10768
//         ],
//         "poster_path":"/6kbAMLteGO8yyewYau6bJ683sw7.jpg",
//         "vote_average":7.8,
//         "name":"The Falcon and the Winter Soldier",
//         "overview":"Following the events of “Avengers: Endgame”, the Falcon, Sam Wilson and the Winter Soldier, Bucky Barnes team up in a global adventure that tests their abilities, and their patience.",
//         "original_name":"The Falcon and the Winter Soldier",
//         "popularity":992.681,
//         "media_type":"tv"
//      },
//      {
//         "name":"The Handmaid's Tale",
//         "backdrop_path":"/jXB3OoWPkojsOP2O2OoLCeAIDRS.jpg",
//         "id":69478,
//         "genre_ids":[
//            10765,
//            18
//         ],
//         "vote_count":1430,
//         "original_language":"en",
//         "original_name":"The Handmaid's Tale",
//         "origin_country":[
//            "US"
//         ],
//         "overview":"Set in a dystopian future, a woman is forced to live as a concubine under a fundamentalist theocratic dictatorship. A TV adaptation of Margaret Atwood's novel.",
//         "poster_path":"/oIkxqt6ug5zT5ZSUUyc1Iqopf02.jpg",
//         "vote_average":8.1,
//         "first_air_date":"2017-04-26",
//         "popularity":435.574,
//         "media_type":"tv"
//      },
//      {
//         "first_air_date":"2017-05-02",
//         "original_name":"La casa de papel",
//         "origin_country":[
//            "ES"
//         ],
//         "backdrop_path":"/xGexTKCJDkl12dTW4YCBDXWb1AD.jpg",
//         "genre_ids":[
//            80,
//            18
//         ],
//         "original_language":"es",
//         "poster_path":"/MoEKaPFHABtA1xKoOteirGaHl1.jpg",
//         "vote_count":13118,
//         "name":"Money Heist",
//         "vote_average":8.3,
//         "id":71446,
//         "overview":"To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.",
//         "popularity":212.019,
//         "media_type":"tv"
//      },
//      {
//         "name":"The Flash",
//         "backdrop_path":"/9Jmd1OumCjaXDkpllbSGi2EpJvl.jpg",
//         "id":60735,
//         "genre_ids":[
//            18,
//            10765
//         ],
//         "vote_count":7784,
//         "original_language":"en",
//         "original_name":"The Flash",
//         "origin_country":[
//            "US"
//         ],
//         "overview":"After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
//         "poster_path":"/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg",
//         "vote_average":7.7,
//         "first_air_date":"2014-10-07",
//         "popularity":1147.478,
//         "media_type":"tv"
//      },
//      {
//         "first_air_date":"1999-10-20",
//         "original_name":"ワンピース",
//         "id":37854,
//         "backdrop_path":"/4Mt7WHox67uJ1yErwTBFcV8KWgG.jpg",
//         "genre_ids":[
//            10759,
//            35,
//            16
//         ],
//         "vote_count":2100,
//         "original_language":"ja",
//         "origin_country":[
//            "JP"
//         ],
//         "name":"One Piece",
//         "poster_path":"/1j4vxmpsjCTIOCUAzevHF8M8aZx.jpg",
//         "overview":"Years ago, the fearsome pirate king Gol D. Roger was executed, leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new pirate king. Monkey D. Luffy, a boy who consumed one of the \"Devil's Fruits\", has it in his head that he'll follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and he's surrounded by a bevy of skilled fighters and thieves to help him along the way. Monkey D. Luffy brings a bunch of his crew followed by, Roronoa Zoro, Nami, Usopp, Sanji, Tony-Tony Chopper, Nico Robin, Franky, and Brook. They will do anything to get the One Piece and become King of the Pirates!..",
//         "vote_average":8.7,
//         "popularity":54.213,
//         "media_type":"tv"
//      },
//      {
//         "genre_ids":[
//            16,
//            10765
//         ],
//         "original_language":"en",
//         "poster_path":"/asDqvkE66EegtKJJXIRhBJPxscr.jpg",
//         "first_air_date":"2019-03-15",
//         "name":"Love, Death \u0026 Robots",
//         "vote_average":8.2,
//         "vote_count":1151,
//         "original_name":"Love, Death \u0026 Robots",
//         "origin_country":[
//            "US"
//         ],
//         "overview":"Terrifying creatures, wicked surprises and dark comedy converge in this NSFW anthology of animated stories presented by Tim Miller and David Fincher.",
//         "id":86831,
//         "backdrop_path":"/nBrkOZyI75artyizuBFeya48KbO.jpg",
//         "popularity":323.498,
//         "media_type":"tv"
//      },
//      {
//         "name":"Why Women Kill",
//         "original_language":"en",
//         "poster_path":"/fI3E1G5N8oimMeyYn5UzWRT2cST.jpg",
//         "vote_average":8.3,
//         "overview":"Three women living in three different decades: a housewife in the '60s, a socialite in the '80s and a lawyer in 2018, deal with infidelity in their marriages.",
//         "original_name":"Why Women Kill",
//         "origin_country":[
//            "US"
//         ],
//         "id":87428,
//         "vote_count":90,
//         "backdrop_path":"/61YttrsiP6B4sJo98HFMuHKPV3G.jpg",
//         "genre_ids":[
//            35,
//            80,
//            18
//         ],
//         "first_air_date":"2019-08-15",
//         "popularity":38.563,
//         "media_type":"tv"
//      },
//      {
//         "vote_average":8.3,
//         "id":95057,
//         "name":"Superman \u0026 Lois",
//         "first_air_date":"2021-02-23",
//         "original_name":"Superman \u0026 Lois",
//         "origin_country":[
//            "US"
//         ],
//         "backdrop_path":"/pPKiIJEEcV0E1hpVcWRXyp73ZpX.jpg",
//         "genre_ids":[
//            10765,
//            10759,
//            18
//         ],
//         "original_language":"en",
//         "poster_path":"/vlv1gn98GqMnKHLSh0dNciqGfBl.jpg",
//         "vote_count":934,
//         "overview":"After years of facing megalomaniacal supervillains, monsters wreaking havoc on Metropolis, and alien invaders intent on wiping out the human race, The Man of Steel aka Clark Kent and Lois Lane come face to face with one of their greatest challenges ever: dealing with all the stress, pressures and complexities that come with being working parents in today's society.",
//         "popularity":757.583,
//         "media_type":"tv"
//      }
//   ],
//   "total_pages":1000,
//   "total_results":20000
//}
