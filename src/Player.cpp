#include "Player.h"

auto Player::Update(std::vector<Bullet>& bullets) -> void
{
	Character::Update(bullets);

	if (IsAlive())
	{
		if (WindowManager::GetEvent().type == sf::Event::EventType::KeyPressed)
		{
			switch (WindowManager::GetEvent().key.code)
			{
			case sf::Keyboard::Key::Left:
				MoveSprite(-3.f);
				break;
			case sf::Keyboard::Key::Right:
				MoveSprite(3.f);
				break;
			}
		}
	}
}

auto Player::Render() -> void
{
	if (IsAlive())
		Character::Render();
}