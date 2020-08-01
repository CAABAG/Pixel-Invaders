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
	virtual auto Shoot(std::vector<Bullet>& bullets)                -> void = 0;

	inline auto IsAlive()                                           -> const bool& { return m_IsAlive; }
	inline auto GetPosition()                                       -> const sf::Vector2f& { return m_Sprite.getPosition(); }
	inline auto GetSize()                                           -> const sf::FloatRect { return m_Sprite.getGlobalBounds(); }
};