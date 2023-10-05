<?php

declare(strict_types=1);

namespace ApiPlatform\Tests\Fixtures\TestBundle\Entity;

use ApiPlatform\Metadata\Operation;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;

#[ApiResource()]
class DisableIdGeneration
{

    #[ApiProperty(identifier: true)]
    public int $id;

    /**
     * @var array<DisableIdGenerationItem>
     */
    #[ApiProperty(genId: false)]
    public array $disableIdGenerationItems;

    public static function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        return $context;
    }
}

class DisableIdGenerationItem
{
    public int $id;

    public string $uuid;

    public int $propertyId;
}
