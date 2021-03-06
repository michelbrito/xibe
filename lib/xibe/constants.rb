#
#	Xibé    Game Programming Library for Ruby
#	Copyright (C) 2009  Michel Brito, www.michelbrito.com
#
#	This library is free software; you can redistribute it and/or
#	modify it under the terms of the GNU Lesser General Public
#	License as published by the Free Software Foundation; either
#	version 2.1 of the License, or (at your option) any later version.
#
#	This library is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#	Lesser General Public License for more details.
#
#	You should have received a copy of the GNU Lesser General Public
#	License along with this library; if not, write to the Free Software
#	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

module Xibe
  
  VERSION = "0.7.0"

  #Types
  ACTIVE = Event::Active
  KEYDOWN = Event::KeyDown
  KEYUP = Event::KeyUp
  MOUSEMOTION = Event::MouseMotion
  MOUSEBUTTONDOWN = Event::MouseButtonDown
  MOUSEBUTTONUP = Event::MouseButtonUp
  JOYAXIS = Event::JoyAxis
  JOYBALL = Event::JoyBall
  JOYHAT = Event::JoyHat
  JOYBUTTONDOWN = Event::JoyButtonDown
  JOYBUTTONUP = Event::JoyButtonUp
  QUIT = Event::Quit
  SYSWM = Event::SysWM
  VIDEORESIZE = Event::VideoResize
  #VIDEOEXPOSE = Event::VideoExpose
  
  #Keyboard
  K_BACKSPACE = Key::BACKSPACE 
  K_TAB = Key::TAB 
  K_CLEAR = Key::CLEAR         
  K_RETURN = Key::RETURN       
  K_PAUSE = Key::PAUSE         
  K_ESCAPE = Key::ESCAPE       
  K_SPACE = Key::SPACE 
  K_EXCLAIM = Key::EXCLAIM
  K_QUOTEDBL = Key::QUOTEDBL
  K_HASH = Key::HASH
  K_DOLLAR = Key::DOLLAR
  K_AMPERSAND = Key::AMPERSAND
  K_QUOTE = Key::QUOTE
  K_LEFTPAREN = Key::LEFTPAREN
  K_RIGHTPAREN = Key::RIGHTPAREN
  K_ASTERISK = Key::ASTERISK
  K_PLUS = Key::PLUS
  K_COMMA = Key::COMMA
  K_MINUS = Key::MINUS
  K_PERIOD = Key::PERIOD
  K_SLASH = Key::SLASH
  K_0 = Key::K0
  K_1 = Key::K1
  K_2 = Key::K2
  K_3 = Key::K3
  K_4 = Key::K4
  K_5 = Key::K5
  K_6 = Key::K6
  K_7 = Key::K7
  K_8 = Key::K8
  K_9 = Key::K9
  K_COLON = Key::COLON
  K_SEMICOLON = Key::SEMICOLON
  K_LESS = Key::LESS
  K_EQUALS = Key::EQUALS
  K_GREATER = Key::GREATER
  K_QUESTION = Key::QUESTION
  K_AT = Key::AT
  K_LEFTBRACKET = Key::LEFTBRACKET
  K_BACKSLASH = Key::BACKSLASH
  K_RIGHTBRACKET = Key::RIGHTBRACKET
  K_CARET = Key::CARET
  K_UNDERSCORE = Key::UNDERSCORE
  K_BACKQUOTE = Key::BACKQUOTE
  K_A = Key::A
  K_B = Key::B
  K_C = Key::C
  K_D = Key::D
  K_E = Key::E
  K_F = Key::F
  K_G = Key::G
  K_H = Key::H
  K_I = Key::I
  K_J = Key::J
  K_K = Key::K
  K_L = Key::L
  K_M = Key::M
  K_N = Key::N
  K_O = Key::O
  K_P = Key::P
  K_Q = Key::Q
  K_R = Key::R
  K_S = Key::S
  K_T = Key::T
  K_U = Key::U
  K_V = Key::V
  K_W = Key::W
  K_X = Key::X
  K_Y = Key::Y
  K_Z = Key::Z
  K_DELETE = Key::DELETE
  K_KP0 = Key::KP0
  K_KP1 = Key::KP1
  K_KP2 = Key::KP2
  K_KP3 = Key::KP3
  K_KP4 = Key::KP4
  K_KP5 = Key::KP5
  K_KP6 = Key::KP6
  K_KP7 = Key::KP7
  K_KP8 = Key::KP8
  K_KP9 = Key::KP9
  K_KP_PERIOD = Key::KP_PERIOD
  K_KP_DIVIDE = Key::KP_DIVIDE
  K_KP_MULTIPLY = Key::KP_MULTIPLY
  K_KP_MINUS = Key::KP_MINUS
  K_KP_PLUS = Key::KP_PLUS
  K_KP_ENTER = Key::KP_ENTER
  K_KP_EQUALS = Key::KP_EQUALS
  K_UP = Key::UP
  K_DOWN = Key::DOWN
  K_RIGHT = Key::RIGHT
  K_LEFT = Key::LEFT
  K_INSERT = Key::INSERT
  K_HOME = Key::HOME
  K_END = Key::END
  K_PAGEUP = Key::PAGEUP
  K_PAGEDOWN = Key::PAGEDOWN
  K_F1 = Key::F1
  K_F2 = Key::F2
  K_F3 = Key::F3
  K_F4 = Key::F4
  K_F5 = Key::F5
  K_F6 = Key::F6
  K_F7 = Key::F7
  K_F8 = Key::F8
  K_F9 = Key::F9
  K_F10 = Key::F10
  K_F11 = Key::F11
  K_F12 = Key::F12
  K_F13 = Key::F13
  K_F14 = Key::F14
  K_F15 = Key::F15
  K_NUMLOCK = Key::NUMLOCK
  K_CAPSLOCK = Key::CAPSLOCK
  K_SCROLLOCK = Key::SCROLLOCK
  K_RSHIFT = Key::RSHIFT
  K_LSHIFT = Key::LSHIFT
  K_RCTRL = Key::RCTRL
  K_LCTRL = Key::LCTRL
  K_RALT = Key::RALT
  K_LALT = Key::LALT
  K_RMETA = Key::RMETA
  K_LMETA = Key::LMETA
  K_LSUPER = Key::LSUPER
  K_RSUPER = Key::RSUPER
  K_MODE = Key::MODE
  K_HELP = Key::HELP
  K_PRINT = Key::PRINT
  K_SYSREQ = Key::SYSREQ
  K_BREAK = Key::BREAK
  K_MENU = Key::MENU
  K_POWER = Key::POWER
  K_EURO = Key::EURO
  
  #Mouse
  MOUSE_LEFT = Mouse::BUTTON_LEFT
  MOUSE_MIDDLE = Mouse::BUTTON_MIDDLE
  MOUSE_RIGHT = Mouse::BUTTON_RIGHT



end