defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "a created deck contains one of the 52 expected cards" do
    deck = Cards.create_deck
    assert Cards.contains?(deck, "Ten of Diamonds")
  end

  test "dealing from the deck results in the given hand_size, and a new deck size" do
    deck = Cards.create_deck
    {hand, deck} = Cards.deal(deck, 5)
    assert length(hand) == 5
    assert length(deck) == 47
  end

  test "creating a hand results in a hand of the given size" do
    {hand_size, _} = Cards.create_hand(7)
    assert length(hand_size) == 7
  end
end
