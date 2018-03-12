require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  def setup
    @rocket = Rocket.new(name: "My Rocket", colour: "red", flying: true)
    @rocket2 = Rocket.new()
  end

  def teardown
    @rocket = nil
    @rocket2 = nil
  end

  def test_initialize_assigns_name_if_set
    expected = "My Rocket"
    actual = @rocket.name

    assert_equal(expected, actual)
  end

  def test_initialize_assigns_random_name_if_none_specified
    expected = String
    actual = @rocket2.name.class

    assert_equal(expected, actual)
  end

  def test_initialize_assigns_colour_if_set
    expected = "red"
    actual = @rocket.colour

    assert_equal(expected, actual)
  end

  def test_initialize_assigns_random_colour_if_none_specified
    expected = String
    actual = @rocket2.colour.class

    assert_equal(expected, actual)
  end

  def test_initialize_assigns_flying
    expected = true
    actual = @rocket.flying?

    assert_equal(expected, actual)
  end

  def test_initialize_assigns_flying_false_if_not_specified
    expected = false
    actual = @rocket2.flying?

    assert_equal(expected, actual)
  end

  def test_colour_assigns_new_value_different_from_original
    @rocket.colour = "blue"

    new_colour = "blue"
    original = "red"

    refute_equal(new_colour, original)
  end

  def test_flying_returns_true_if_flying_true
    expected = true
    actual = @rocket.flying?

    assert_equal(expected, actual)
  end

  def test_flying_returns_false_if_flying_false
    expected = false
    actual = @rocket2.flying?

    assert_equal(expected, actual)
  end

  def test_lift_off_returns_false_if_flying_true
    expected = false
    actual = @rocket.lift_off

    assert_equal(expected, actual)
  end

  def test_lift_off_returns_true_if_flying_false
    expected = true
    actual = @rocket2.lift_off

    assert_equal(expected, actual)
  end

  def test_lift_off_changes_flying_to_true_if_flying_false
    @rocket2.lift_off

    expected = true
    actual = @rocket2.flying?

    assert_equal(expected, actual)
  end

  def test_land_returns_true_if_flying
    expected = true
    actual = @rocket.land

    assert_equal(expected, actual)
  end

  def test_land_returns_false_if_not_flying
    expected = false
    actual = @rocket2.land

    assert_equal(expected, actual)
  end

  def test_land_changes_flying_to_false_if_flying_true
    @rocket.land

    expected = false
    actual = @rocket.flying?

    assert_equal(expected, actual)
  end

  def test_status_flying_if_flying
    expected = "Rocket My Rocket is flying through the sky!"
    actual = @rocket.status

    assert_equal(expected, actual)
  end

  def test_status_ready_for_lift_off_if_not_flying
    expected = "Rocket #{@rocket2.name} is ready for lift off!"
    actual = @rocket2.status

    assert_equal(expected, actual)
  end

end
