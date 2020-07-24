#include "WindowManager.h"

int main()
{
	WindowManager::Create(800, 680);

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

		WindowManager::ClearWindow();
		WindowManager::DisplayWindow();
	}

	return 0;
}