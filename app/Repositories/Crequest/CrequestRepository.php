<?php

namespace App\Repositories\Crequest;

use App\Repositories\BaseRepository as BaseRepository;
use Auth;

/**
 *
 */
class CrequestRepository extends BaseRepository implements CrequestRepositoryInterface
{
    public function model()
    {
        return \App\Model\Crequest::class;
    }

    public function markNotify($id)
    {
        foreach (Auth::user()->unreadNotifications as $notification) {
            if ($notification->data['request_id'] == $id) {
                $notification->markAsRead();
            }
        }
    }
}
