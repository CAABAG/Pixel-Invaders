#pragma once

#include "Character.h"
#include "WindowManager.h"

class Player : public Character
{
public:
	Player(const sf::Texture& texture, float xPos, float yPos) : Character(texture, xPos, yPos) {};

	auto Update(std::vector<Bullet>& bullets)                                                   -> void;
	auto Render()                                                                               -> void;
};