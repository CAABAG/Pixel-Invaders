#include "Character.h"

Character::Character(const sf::Texture& texture, float xPos, float yPos) : m_IsAlive(true)
{
	m_Sprite.setTexture(texture);
	m_Sprite.setOrigin(m_Sprite.getGlobalBounds().width / 2, m_Sprite.getGlobalBounds().height / 2);
	m_Sprite.setPosition(WindowManager::MapPixelsToCoords(WindowManager::PercentsToPixelsX(xPos), WindowManager::PercentsToPixelsY(yPos)));
}

auto Character::Update(std::vector<Bullet>& bullets) -> void
{
	for (unsigned int i = 0; i < bullets.size(); i++)
	{
		if (m_Sprite.getGlobalBounds().intersects(bullets[i].GetRectangleShape().getGlobalBounds()))
		{
			m_IsAlive = false;
			bullets[i].SetExistsBool(false);
		}
	}
}