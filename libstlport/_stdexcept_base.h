/*
 * Copyright (c) 1996,1997
 * Silicon Graphics Computer Systems, Inc.
 *
 * Copyright (c) 1999
 * Boris Fomitchev
 *
 * This material is provided "as is", with absolutely no warranty expressed
 * or implied. Any use is at your own risk.
 *
 * Permission to use or copy this software for any purpose is hereby granted
 * without fee, provided the above notices are retained on all copies.
 * Permission to modify the code and to distribute modified code is granted,
 * provided the above notices are retained, and a notice that the code was
 * modified is included with the above copyright notice.
 *
 */

#ifndef _STL_STDEXCEPT_BASE
#define _STL_STDEXCEPT_BASE

#define string typedefed_string
#include <string>
#undef string

class S : public std::basic_string<char, std::char_traits<char>, std::allocator<char> >
{};


namespace std {

class __Named_exception {
public:
  __Named_exception(const S& __str);
  __Named_exception(const __Named_exception&);
  __Named_exception& operator = (const __Named_exception&);

  const char* what() const;
  ~__Named_exception();

private:
  enum { _S_bufsize = 256 };
  char _M_static_name[_S_bufsize];
  char *_M_name;
};

}

#endif /* _STL_STDEXCEPT_BASE */
