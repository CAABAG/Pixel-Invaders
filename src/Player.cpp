#include "Player.h"

auto Player::Update(std::vector<Bullet>& bullets) -> void
{
	if(!bullets.empty())
		Character::Update(bullets);

	if (IsAlive())
	{
		if (WindowManager::GetEvent().type == sf::Event::EventType::KeyPressed)
		{
			switch (WindowManager::GetEvent().key.code)
			{
			case sf::Keyboard::Key::Left:
				MoveSprite(-5.f);
				break;
			case sf::Keyboard::Key::Right:
				MoveSprite(5.f);
				break;
			case sf::Keyboard::Key::LControl:
				Shoot(bullets);
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

auto Player::Shoot(std::vector<Bullet>& bullets) -> void
{
	sf::Vector2f startingPos = { GetPosition().x, GetPosition().y - GetSize().height };
	Bullet bullet(WindowManager::PercentsToPixelsX(0.5f), WindowManager::PercentsToPixelsY(2.f), startingPos.x, startingPos.y, BulletDirection::UPWARDS);
	bullets.push_back(bullet);
}