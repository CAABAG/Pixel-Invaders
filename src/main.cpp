#include "WindowManager.h"
#include "Player.h"
#include "Bullet.h"
#include <vector>

int main()
{
	WindowManager::Create(800, 680);

	sf::Texture playerTexture;
	playerTexture.loadFromFile("../graphics/player.png");
	Player player(playerTexture, 50.f, 90.f);

	std::vector<Bullet> bullets;

	while (WindowManager::IsWindowOpen())
	{
		while (WindowManager::PollEvent())
		{
			switch (WindowManager::GetEvent().type)
			{
			case sf::Event::EventType::Closed:
				WindowManager::CloseWindow();
				break;
			}
		}

		if (!bullets.empty())
		{
			for (Bullet& element : bullets)
				element.Update();
		}

		player.Update(bullets);

		WindowManager::ClearWindow();

		if (!bullets.empty())
		{
			for (Bullet& element : bullets)
				element.Render();
		}

		player.Render();

		WindowManager::DisplayWindow();
	}

	return 0;
}