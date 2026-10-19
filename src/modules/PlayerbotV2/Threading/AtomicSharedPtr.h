// AtomicSharedPtr - std::atomic<std::shared_ptr<T>> stand-in for compilers without C++20 library support (GCC 11).
// Same load/store interface; uses the atomic_load/atomic_store overloads for shared_ptr, which every standard library has.

#pragma once

#include <atomic>
#include <memory>

namespace Playerbot {

#if defined(__cpp_lib_atomic_shared_ptr) && __cpp_lib_atomic_shared_ptr >= 201711L
template <typename T> using AtomicSharedPtr = std::atomic<std::shared_ptr<T>>;
#else
template <typename T>
class AtomicSharedPtr
{
public:
    AtomicSharedPtr() = default;
    AtomicSharedPtr(AtomicSharedPtr const&) = delete;
    AtomicSharedPtr& operator=(AtomicSharedPtr const&) = delete;

    void store(std::shared_ptr<T> p, std::memory_order order = std::memory_order_seq_cst) noexcept
    { std::atomic_store_explicit(&_p, std::move(p), order); }
    std::shared_ptr<T> load(std::memory_order order = std::memory_order_seq_cst) const noexcept
    { return std::atomic_load_explicit(&_p, order); }

private:
    std::shared_ptr<T> _p;
};
#endif

} // namespace Playerbot
