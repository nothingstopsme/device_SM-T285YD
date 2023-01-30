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

#include "_stdexcept_base.h"
#include <stdlib.h>

namespace std {

__Named_exception::__Named_exception(const S& __str) {
  size_t __size = __str.length() + 1;
  if (__size > _S_bufsize) {
    _M_name = static_cast<char*>(malloc(__size * sizeof(char)));
    if (!_M_name) {
      __size = _S_bufsize;
      _M_name = _M_static_name;
    }
    else {
      *(reinterpret_cast<size_t*>(&_M_static_name[0])) = __size * sizeof(char);
    }
  }
  else {
    _M_name = _M_static_name;
  }
  strncpy(_M_name, __str.c_str(), __size - 1);
  _M_name[__size - 1] = '\0';
}

__Named_exception::__Named_exception(const __Named_exception& __x) {
  size_t __size = strlen(__x._M_name) + 1;
  if (__size > _S_bufsize) {
    _M_name = static_cast<char*>(malloc(__size * sizeof(char)));
    if (!_M_name) {
      __size = _S_bufsize;
      _M_name = _M_static_name;
    }
    else {
      *(reinterpret_cast<size_t*>(&_M_static_name[0])) = __size * sizeof(char);
    }
  }
  else {
    _M_name = _M_static_name;
  }
  strncpy(_M_name, __x._M_name, __size - 1);
  _M_name[__size - 1] = '\0';
}

__Named_exception& __Named_exception::operator = (const __Named_exception& __x) {
  size_t __size = strlen(__x._M_name) + 1;
  size_t __buf_size = _M_name != _M_static_name ? *(reinterpret_cast<size_t*>(&_M_static_name[0])) : static_cast<size_t>(_S_bufsize);
  if (__size > __buf_size) {
    // Being here necessarily mean that we need to allocate a buffer:
    if (_M_name != _M_static_name) free(_M_name);
    _M_name = static_cast<char*>(malloc(__size * sizeof(char)));
    if (!_M_name) {
      __size = _S_bufsize;
      _M_name = _M_static_name;
    }
    else {
      *(reinterpret_cast<size_t*>(&_M_static_name[0])) = __size * sizeof(char);
    }
  }
  strncpy(_M_name, __x._M_name, __size - 1);
  _M_name[__size - 1] = '\0';
  return *this;
}

__Named_exception::~__Named_exception() {
  if (_M_name != _M_static_name)
    free(_M_name);
}

const char* __Named_exception::what() const
{ return _M_name; }

} // namespace std
