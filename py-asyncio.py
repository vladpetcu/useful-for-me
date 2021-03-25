import asyncio


buff = list()

async def recv_call(data):
    print('recv_call:', data)
    return f'{data}fromRCV'

async def recv(data):
    print('in recv:', data)
    await asyncio.sleep(1)
    res = await recv_call(data)
    return res


def when_future_finishes(future):
    print('\nFUTURE finished, res:', type(future), future.result())


def send_call(data):
    print('send_call:', data)

async def send(data):
    print('in send:', data)
    await asyncio.sleep(2)
    
    send_future = loop.create_future()
    send_future.add_done_callback(when_future_finishes)

    buff.append(send_future)
    result = await send_future
    return result

async def main():
    print('main')
    res1 = loop.create_task(send('send_task'))
    res2 = loop.create_task(recv('recv_task'))

    await asyncio.sleep(3)
    if not buff[0].cancelled():
        buff[0].set_result('RESULT')
        buff.pop()

    await asyncio.wait([res1, res2])

    print('\nend main', res1.result(), res2.result(), len(buff))

if __name__ == '__main__':
    try:
        loop = asyncio.get_event_loop()
        loop.set_debug(1)
        loop.run_until_complete(main())

        # OR
        # loop = asyncio.get_event_loop()
        # coro = main(loop)
        # print(f'loop type: {type(loop)} ; coro type: {type(coro)}')
        # asyncio.ensure_future(coro)
        # loop.run_forever()

        loop.close()
    except Exception as e:
        print('\nERR: ', e)
