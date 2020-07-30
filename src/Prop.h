#pragma once

#include "SFML/Graphics.hpp"
#include "WindowManager.h"

class Prop
{
protected:
	sf::RectangleShape                                          m_Rectangle;
	bool                                                        m_Exists;

	Prop(float width, float height, float xPos, float yPos);
	auto Render()                                               -> void;

public:
	auto SetExistsBool(const bool exists)                       -> void { m_Exists = exists; }

	auto GetRectangleShape()                                    -> sf::RectangleShape& { return m_Rectangle; }
};