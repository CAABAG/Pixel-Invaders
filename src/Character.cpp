#include "Character.h"

Character::Character(const sf::Texture& texture, float xPos, float yPos) : m_IsAlive(true)
{
	m_Sprite.setTexture(texture);
	m_Sprite.setOrigin(m_Sprite.getGlobalBounds().width, m_Sprite.getGlobalBounds().height);
	m_Sprite.setPosition(WindowManager::MapPixelsToCoords(xPos, yPos));
}

auto Character::Update(std::vector<Bullet>& bullets) -> void
{
	if (!bullets.empty())
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
}