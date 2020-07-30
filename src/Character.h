#pragma once

#include "SFML/Graphics.hpp"
#include "WindowManager.h"
#include "Bullet.h"

class Character
{
private:
	sf::Sprite                                                      m_Sprite;
	bool                                                            m_IsAlive;

protected:
	Character(const sf::Texture& texture, float xPos, float yPos);

	auto Update(std::vector<Bullet>& bullets)                       -> void;
	inline auto Render()                                            -> void { WindowManager::Draw(m_Sprite); }
	inline auto MoveSprite(const float speed)                       -> void { m_Sprite.move(speed, 0.f); }

	inline auto IsAlive()                                           -> const bool& { return m_IsAlive; }
};