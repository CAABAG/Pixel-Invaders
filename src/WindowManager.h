#pragma once

#include <SFML/Graphics.hpp>

class WindowManager
{
private:
	sf::RenderWindow                                        m_Window;
	sf::Event                                               m_Event;

	WindowManager() {}
public:
	WindowManager(WindowManager const&)                     = delete;
	void operator=(WindowManager const&)                    = delete;

	inline static auto Create(int width, int height)        -> void { GetWindow().create(sf::VideoMode(width, height), "Pixel Invaders"); GetWindow().setVerticalSyncEnabled(true); }
	inline static auto PollEvent()                          -> bool { return GetWindow().pollEvent(GetEvent()); }
	inline static auto CloseWindow()                        -> void { GetWindow().close(); }
	inline static auto DisplayWindow()                      -> void { GetWindow().display(); }
	inline static auto Draw(const sf::Drawable& drawable)   -> void { GetWindow().draw(drawable); }
	inline static auto ClearWindow()                        -> void { GetWindow().clear(sf::Color::Black); }
	inline static auto PercentsToPixelsX(float percents)    -> float { return GetWindow().getSize().x * percents / 100.f; }
	inline static auto PercentsToPixelsY(float percents)    -> float { return GetWindow().getSize().y * percents / 100.f; }
	inline static auto MapPixelsToCoords(float x, float y)  -> sf::Vector2f { return GetWindow().mapPixelToCoords({ static_cast<int>(x), static_cast<int>(y) }); }
	inline static auto MapXPixelsToCoords(float x)          -> float { return GetWindow().mapPixelToCoords({ static_cast<int>(x), 0 }).x; }
	inline static auto MapYPixelsToCoords(float y)          -> float { return GetWindow().mapPixelToCoords({ 0, static_cast<int>(y) }).y; }

	inline static auto GetInstance()                        -> WindowManager& { static WindowManager instance; return instance; }
	inline static auto IsWindowOpen()                       -> bool { return GetWindow().isOpen(); }
	inline static auto GetWindow()                          -> sf::RenderWindow& { return GetInstance().m_Window; }
	inline static auto GetEvent()                           -> sf::Event& { return GetInstance().m_Event; }
};