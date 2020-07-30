#pragma once

#include "Prop.h"

enum class BulletDirection
{
	UPWARDS,
	DOWNWARDS
};

class Bullet : public Prop
{
private:
	BulletDirection                                                                          m_Direction;
public:
	Bullet(float width, float height, float xPos, float yPos, BulletDirection direction) 
		: Prop(width, height, xPos, yPos), m_Direction(direction) {}

	auto Update()                                                                            -> void;
	auto Render()                                                                            -> void;
};