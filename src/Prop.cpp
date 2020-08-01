#include "Prop.h"

Prop::Prop(float width, float height, float xPos, float yPos) : m_Exists(true)
{
	m_Rectangle.setSize({ width, height });
	m_Rectangle.setFillColor(sf::Color::White);
	m_Rectangle.setOrigin( width / 2, height / 2 );
	m_Rectangle.setPosition(WindowManager::MapPixelsToCoords(xPos, yPos));
}

auto Prop::Render() -> void
{
	if (m_Exists)
		WindowManager::Draw(m_Rectangle);
}