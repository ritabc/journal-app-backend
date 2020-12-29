module SeedUserData

  def save_journal (user_id, journal_name)
    journal = Journal.create!(user_id: user_id, name: journal_name)
    journal.id
  end

  def save_note (journal_id, title, content, created_at)
    Note.create!(journal_id: journal_id, title: title, content: content, created_at: created_at)
  end

  def seed_initial_user_data(u_id)
    recipes_id = save_journal(u_id, "Recipes")
    save_note(recipes_id, "Black Bean Veggie Burgers", "This is a great veggie burger made with parmesean, crunchy cachews, and chipotle peppers.", DateTime.new(2020, 12, 28))
    save_note(recipes_id, "Tropical Dream Pie","From the Moosewood vegetarian cookbook, made of a ginger snap, coconut flake, and pecan crust, a sweetened condensed milk filling with lime juice & zest, and a layer of ripe bananas and mangos.", DateTime.new(2020, 12, 22) )
    save_note(recipes_id, "Flourless Almond Cake", "Like a flourless chocolate cake in that it has many eggs, but made of blanched almond flour", DateTime.new(2019, 4, 3))
    save_note(recipes_id, "Fried Rice", "The secrets to this simple recipe involve cold, dry, pre-cooked rice, and lots of fresh ginger", DateTime.new(2017, 8,1))

    daily_id = save_journal(u_id, "Daily Notes")
    save_note(daily_id, "Holiday 2020 Celebration", "Saw the family outdoors to celebrate the Christmas holiday. It was chilly but we met around a fire pit and bundled the dogs up in many sweaters.", DateTime.new(2020, 12, 23, 10, 0, 0))
    save_note(daily_id, "Dog December Meds", "Gave the dog her heartworm medicine and her flea/tick medince. She'll be due for heartworm again in January and flea/tick in March.", DateTime.new(2020, 12,12))
    save_note(daily_id, "Halloween 2020", "Dressed the dog as a horse for Halloween. She was a little chilly but a good sport about it.", DateTime.new(2020, 10,31))
    save_note(daily_id, "Dog Apopted!", "Adopted the new dog! She is tiny (8lbs!) and very playful. She was adopted from Cause for Paws NC.", DateTime.new(2020, 10,10))
    save_note(daily_id, "Restless", "We're getting restless and are thinking about adopting a dog. We like going on walks and would love to have a furry family member to explore the outdoors with.", DateTime.new(2020, 9,1))
    save_note(daily_id, "WFH 3 Month Anniversary", "We have officially been working form home for 3 months. It feels like less than that and more than that at the same time", DateTime.new(2020, 6, 15))

    dream_id = save_journal(u_id, "Dream Diary")
    save_note(dream_id, "Flying", "Last night I flew around the sky as a witch. But instead of a broomstick, I was perched on a mop. I wonder what it means?", DateTime.new(2020, 11,18))

    introspective_id = save_journal(u_id, "Introspective Notes")
    save_note(introspective_id, "Chocolates", "Today I was thinking about Forrest Gump and how life is like a box of chocolates. What an interesting movie.", DateTime.new(2016, 1,6))

    travel_id = save_journal(u_id, "Travel Notes")
    save_note(travel_id, "Antarctica", "I was finally able to travel to the Antarctic last month! It was beautiful, but so cold - I'm surprised that I still have all my fingers and toes!", DateTime.new(2018, 12,2))
  end
end