#include "Bullet.h"

auto Bullet::Update() -> void
{
	if (m_Exists)
	{
		switch (m_Direction)
		{
		case BulletDirection::UPWARDS:
			m_Rectangle.move(0.f, -2.f);
			break;
		case BulletDirection::DOWNWARDS:
			m_Rectangle.move(0.f, 2.f);
			break;
		}

		if (GetRectangleShape().getPosition().y < 0 || GetRectangleShape().getPosition().y > WindowManager::GetWindow().getSize().y)
			m_Exists = false;
	}
}

auto Bullet::Render() -> void
{
	Prop::Render();
}